import 'package:bookstore_app/core/services/dio_helper.dart';
import 'package:bookstore_app/features/search/data/model/filter_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  Future<void> fetchFilteredBooks({String? category, int? price}) async {
    emit(FilterLoading());

    try {
      final response = await DioHelper.getData(
        url: 'books-filter',
        query: {
          if (category != null) 'category': category,
          if (price != null) 'price': price.toString(),
        },
      );

      final filterModel = FilterModel.fromJson(response.data);

      if (filterModel.status == 200) {
        emit(FilterSuccess(filterModel.data?.books ?? []));
      } else {
        emit(FilterError(filterModel.message ?? 'حدث خطأ غير متوقع'));
      }
    } catch (e) {
      emit(FilterError('فشل الاتصال بالخادم: $e'));
    }
  }
}
