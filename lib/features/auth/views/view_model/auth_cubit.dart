import 'package:bookstore_app/core/services/dio_helper.dart';

import 'package:bookstore_app/features/auth/views/view_model/auth_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());

  AuthCubit get(context) => BlocProvider.of(context);

  signIn({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(url: '/sign-in', data: {
      'email': email,
      'password': password,
    }).then((value) {
      String message = value.data['message'];
      DioHelper.token=value.data['data']['token'];
      emit(LoginSuccessState(message: message));
    }).onError((error, stackTrace) {
      emit(LoginErrorState(error: "Invalid email or password"));
    });
  }
}
