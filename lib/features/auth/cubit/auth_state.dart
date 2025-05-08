



import 'package:bookstore_app/features/auth/data/model/auth%20model/user.model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);

  String get errorMessage => 'errorMessage';
}
