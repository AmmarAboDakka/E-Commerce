import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/enums.dart';

import 'package:e_commerce/module/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_commerce/module/features/auth/domain/usecases/login_with_email_and_pass_usecase.dart';
import 'package:e_commerce/module/features/auth/domain/usecases/register_with_email_and_pass_usecase.dart';
import 'package:e_commerce/module/features/auth/presentation/bloc/auth_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginInWithEmailAndPasswordUseCase loginInWithEmailAndPasswordUseCase;
  final RegisterWithEmailandPasswordUsecase registerWithEmailandPasswordUsecase;
  AuthBloc(this.loginInWithEmailAndPasswordUseCase,
      this.registerWithEmailandPasswordUsecase)
      : super(const AuthState()) {
    on<AuthEvent>((event, emit) {});
    on<LoginWithEmailAndPasswordEvent>((event, emit) {
      return _loginWithEmailAndPassword(event.email, event.password);
    });

    on<RegisterWithEmailAndPasswordEvent>(
      (event, emit) {
        return _registerWithEmailAndPassword(
            event.email, event.password, event.name, event.phone);
      },
    );
  }

  void _loginWithEmailAndPassword(String email, String password) async {
    emit(state.copyWith(loginState: RequestState.loading));

    final resulte = await loginInWithEmailAndPasswordUseCase(
        LoginParam(email: email, password: password));

    emit(resulte.fold((failure) {
      if (kDebugMode) {
        print(failure.toString());
      }
      return state.copyWith(
        loginState: RequestState.error,
        loginErrorMessage: failure.message.toString(),
      );
    }, (response) {
      if (kDebugMode) {
        print(response.toString());
      }
      return state.copyWith(loginState: RequestState.loaded);
    }));
  }

  void _registerWithEmailAndPassword(
      String email, String password, String name, String phone) async {
    emit(state.copyWith(registerState: RequestState.loading));

    final result = await registerWithEmailandPasswordUsecase(RegisterParam(
        email: email, password: password, name: name, phone: phone));

    emit(result.fold((failure) {
      if (kDebugMode) {
        print(failure.toString());
      }
      return state.copyWith(
          registerState: RequestState.error,
          registerErrorMessage: failure.message.toString());
    }, (response) {
      if (kDebugMode) {
        print(response.toString());
      }
      return state.copyWith(registerState: RequestState.loaded);
    }));
  }
}
