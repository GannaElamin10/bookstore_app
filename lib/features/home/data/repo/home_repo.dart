import 'package:bookstore_app/core/errors/failure.dart';
import 'package:bookstore_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Failure, List<BookModel>>> fetchfeatureBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
}
