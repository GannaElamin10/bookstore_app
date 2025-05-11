import 'package:bookstore_app/features/search/data/model/filter_model.dart';

abstract class FilterState {}

class FilterInitial extends FilterState {}

class FilterLoading extends FilterState {}

class FilterSuccess extends FilterState {
  final List<Books> filteredBooks;

  FilterSuccess(this.filteredBooks);
}

class FilterError extends FilterState {
  final String message;

  FilterError(this.message);
}
