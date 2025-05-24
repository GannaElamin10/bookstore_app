import 'package:bookstore_app/features/home/data/models/book_model.dart';

class HomeStates {}

class HomeInitState extends HomeStates {}

// class HomeLoadingState extends HomeState {}

// class HomeSuccessState extends HomeState {
//   // final List<BookModel> books;
//   // HomeSuccessState(this.books);
// }

//Slider

//get all

class GetLimitBooksLoadingState extends HomeStates {}

class GetLimitBooksSucessState extends HomeStates {
  final List<Books> books;

  GetLimitBooksSucessState({required this.books});
}

class GetLimitBooksErrorState extends HomeStates {}

class CartActionSuccessState extends HomeStates {
  final String message;
  CartActionSuccessState(this.message);
}

class CartActionFailedState extends HomeStates {
  final String message;
  CartActionFailedState(this.message);
}
