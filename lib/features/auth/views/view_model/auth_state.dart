class AuthStates{}

class AuthInitState extends AuthStates{}


class LoginLoadingState extends AuthStates{}
class LoginSuccessState extends AuthStates{
  final String message;

  LoginSuccessState({required this.message});
}
class LoginErrorState extends AuthStates{
  final String error;

  LoginErrorState({required this.error});
}