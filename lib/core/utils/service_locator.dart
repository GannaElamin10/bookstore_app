import 'package:bookstore_app/core/utils/api_service.dart';
import 'package:bookstore_app/features/auth/data/model/repo/auth_repo_imp.dart';

import 'package:bookstore_app/features/home/data/repo/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  final apiService = ApiService(Dio());
  getIt.registerSingleton<ApiService>(apiService);
  getIt.registerLazySingleton<HomeRepoImp>(() => HomeRepoImp(getIt<ApiService>()));
  getIt.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(getIt<ApiService>()));
}
