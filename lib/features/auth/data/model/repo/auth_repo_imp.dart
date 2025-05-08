import 'package:bookstore_app/core/errors/failure.dart';
import 'package:bookstore_app/core/utils/api_service.dart';
import 'package:bookstore_app/features/auth/data/model/auth%20model/user.model.dart';
import 'package:bookstore_app/features/auth/data/model/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.dio.post(
        'sign-in',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final user = User.fromJson(response.data['data']['user']);
        return Right(user);
      } else {
        return Left(ServerFailure('Invalid Credentials'));
      }
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
