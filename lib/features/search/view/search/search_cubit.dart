import 'package:bookstore_app/features/search/data/model/search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:bookstore_app/core/services/dio_helper.dart';
import 'search_state.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
 Future<void> fetchSearch() async {
    emit(SearchLoading());

    try {
      final response = await DioHelper.getData(
        url: '/books-search',
        query: {'title': ''}, // استخدم المتغير المرسل
      );

      final List<dynamic>? booksJson = response.data['data']['books'];
      final books = booksJson?.map((json) => SearchModel.fromJson(json)).toList() ?? [];

      emit(SearchSuccess(books));
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'خطأ في الاتصال بالسيرفر';
      emit(SearchError(message));
    } catch (e) {
      emit(SearchError('حدث خطأ غير متوقع'));
    }
  }
}
