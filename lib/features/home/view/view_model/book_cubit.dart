 import 'package:bookstore_app/features/home/view/view_model/book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitState());
}