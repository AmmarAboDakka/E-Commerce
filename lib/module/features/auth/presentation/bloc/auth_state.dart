// // ignore_for_file: public_member_api_docs, sort_constructors_first
// part of 'auth_bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:e_commerce/core/utils/enums.dart';

class AuthState extends Equatable {
  const AuthState({
    this.loginState = RequestState.loaded,
    this.registerState = RequestState.loaded,
    this.loginErrorMessage = '',
    this.registerErrorMessage = '',
  });
  final RequestState loginState;
  final String loginErrorMessage;
  final RequestState registerState;
  final String registerErrorMessage;

  @override
  List<Object?> get props => [
        loginState,
        registerState,
        loginErrorMessage,
        registerErrorMessage,
      ];

  AuthState copyWith({
    RequestState? loginState,
    String? loginErrorMessage,
    RequestState? registerState,
    String? registerErrorMessage,
  }) {
    return AuthState(
      loginState: loginState ?? this.loginState,
      loginErrorMessage: loginErrorMessage ?? this.loginErrorMessage,
      registerState: registerState ?? this.registerState,
      registerErrorMessage: registerErrorMessage ?? this.registerErrorMessage,
    );
  }
}
