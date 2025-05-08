import 'package:bookstore_app/features/auth/data/model/auth%20model/user.model.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore_app/core/errors/failure.dart';


abstract class AuthRepo {
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  });
}
