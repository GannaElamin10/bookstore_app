
import 'package:bookstore_app/features/auth/data/model/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> signIn( {required String email, required String password}) async {
    emit(AuthLoading());

    final result = await authRepo.signIn(email: email, password: password);

    result.fold(
      (failure) => emit(AuthFailure(failure.errMessage)),
      (user) => emit(AuthSuccess(user),
    ));
  }
}
