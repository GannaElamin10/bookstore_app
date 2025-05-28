import 'dart:async';

import 'package:bookstore_app/core/services/dio_helper.dart';
import 'package:bookstore_app/features/home/data/models/book_model.dart';
import 'package:bookstore_app/features/home/view/view_model/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  HomeCubit get(context) => BlocProvider.of(context);

  List<BookModel>? books;

  getlimitBooks() async {
    emit(GetLimitBooksLoadingState());


    await DioHelper.getData(url: "/books", query: {'limit': 2}).then((value) async {
      books = List<BookModel>.from(
        value.data['data']['books'].map((book) => BookModel.fromJson(book)),
      );


      emit(GetLimitBooksSucessState(books: books!));
    }).onError(
      (error, stackTrace) {
        emit(GetLimitBooksErrorState());
      },
    );
  }

  Future<void> getFavouriteBooks()async {
      final response = await DioHelper.getData(url: '/show-wishlist', query: {});
      final List<dynamic>? wishlistJson = response.data['data']['books'];
      final favouriteBooks = wishlistJson?.map((json) => BookModel.fromJson(json)).toList() ?? [];
  }
}
