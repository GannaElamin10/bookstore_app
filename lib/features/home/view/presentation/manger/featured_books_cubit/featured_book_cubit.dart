import 'package:bookstore_app/features/home/data/repo/home_repo.dart';
import 'package:bookstore_app/features/home/view/presentation/manger/featured_books_cubit/featured_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepo) : super(FeaturedBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchfeatureBooks() async {
    emit(FeaturedBookLoading());

    var result = await homeRepo.fetchfeatureBooks();

    result.fold(
      (failure) {
        emit(FeaturedBookFailure(failure.errMessage));
      },
      (books) {
        emit(FeaturedBookSuccess(books: books));
      },
    );
  }
}
