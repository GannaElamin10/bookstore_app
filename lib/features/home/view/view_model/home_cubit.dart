import 'dart:async';

import 'package:bookstore_app/core/magic_router/magic_router.dart';
import 'package:bookstore_app/core/services/dio_helper.dart';
import 'package:bookstore_app/core/utils/snack_bar.dart';
import 'package:bookstore_app/features/cart/view/view_model/cart_state.dart';
import 'package:bookstore_app/features/home/data/models/book_model.dart';
import 'package:bookstore_app/features/home/view/view_model/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  HomeCubit get(context) => BlocProvider.of(context);

  List<Books>? books;

  Future<void> addToCart(int bookId) async {
    emit(GetLimitBooksLoadingState());

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      DioHelper.token = token;
      final response = await DioHelper.postData(
        url: '/add-to-cart',
        data: {'book_id': bookId},
        token: token,
      );

      final data = response.data as Map<String, dynamic>;

      await getlimitBooks();

      if (data['status'] == true) {
        emit(CartActionSuccessState(data['message']));
        Utils.showSnackBar(MagicRouter.currentContext!, data['message']);
      } else {
        emit(CartActionFailedState(data['message']));
        Utils.showSnackBar(MagicRouter.currentContext!, data['message']);
      }
    } catch (error) {
      // emit(CartErrorState('Add to Cart Error: $error'));
    }
  }

  getlimitBooks() {
    emit(GetLimitBooksLoadingState());

    DioHelper.getData(url: "/books", query: {'limit': 2}).then((value) {
      books = List<Books>.from(
        value.data['data']['books'].map((book) => Books.fromJson(book)),
      );

      emit(GetLimitBooksSucessState(books: books!));
    }).onError(
      (error, stackTrace) {
        emit(GetLimitBooksErrorState());
      },
    );
  }
}
