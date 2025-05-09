import 'package:bookstore_app/features/home/data/models/book_model.dart';

class BookState {}
class BookInitState extends BookState {}

class BookLoadingState extends BookState {}

class BookSuccessState extends BookState {
  final List<BookModel> books;
  BookSuccessState(this.books);
}