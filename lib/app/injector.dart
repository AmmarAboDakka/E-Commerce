// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:e_commerce/module/features/auth/data/datasources/auth_remote_data_sourse.dart';
import 'package:e_commerce/module/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:e_commerce/module/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_commerce/module/features/auth/domain/usecases/login_with_email_and_pass_usecase.dart';
import 'package:e_commerce/module/features/auth/domain/usecases/register_with_email_and_pass_usecase.dart';
import 'package:e_commerce/module/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:e_commerce/module/features/home/data/datasources/home_remore_data_source.dart';
import 'package:e_commerce/module/features/home/data/repositories/home_repository_imp.dart';
import 'package:e_commerce/module/features/home/domain/repositories/home_repository.dart';
import 'package:e_commerce/module/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/api/api_consumer.dart';
import '../core/api/app_interceptor.dart';
import '../core/api/dio_consumer.dart';

import '../core/networks/network_informatiom.dart';
import '../module/features/home/domain/usecases/home_usecase.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  ///Bloc

  getIt.registerFactory(() => AuthBloc(getIt(), getIt()));
  getIt.registerFactory(() => HomeBloc(getIt()));

  ///UseCase
  getIt
      .registerLazySingleton(() => LoginInWithEmailAndPasswordUseCase(getIt()));
  getIt.registerLazySingleton(
      () => RegisterWithEmailandPasswordUsecase(getIt()));

  getIt.registerLazySingleton(() => HomeUsecase(getIt()));

  ///Repositories
  getIt.registerLazySingleton<Authrepository>(() => AuthrepositoryImp(
        getIt(),
        getIt(),
      ));
  getIt.registerLazySingleton<HomeRepository>(
      () => HomerepositoruImpelmentation(getIt(), getIt()));

  ///DataSource

  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImplementationWithApi(getIt()));

  getIt.registerLazySingleton<HomeRemoreDataSource>(
      () => HomeRemoreDataSourcewithApi(getIt()));

  ///Utils

  getIt.registerLazySingleton<NetworkInformation>(() =>
      NetworkInformationImplementation(internetConnectionChecker: getIt()));

  getIt.registerLazySingleton<ApiCounsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton(() => AppInterceptor());
  getIt.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        error: true,
        responseBody: true,
        responseHeader: true,
      ));

  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
