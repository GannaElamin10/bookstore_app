import 'package:bookstore_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedBookState extends Equatable {
  const FeaturedBookState();

  @override
  List<Object> get props => [];
}

class FeaturedBookInitial extends FeaturedBookState {}

class FeaturedBookLoading extends FeaturedBookState {}

class FeaturedBookFailure extends FeaturedBookState {
  final String errMessage;

  const FeaturedBookFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookModel> books;

  const FeaturedBookSuccess({required this.books});

  @override
  List<Object> get props => [books];
}
