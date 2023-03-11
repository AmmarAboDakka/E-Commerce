

part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginWithEmailAndPasswordEvent extends AuthEvent{
final  String email;
final  String password;

  const LoginWithEmailAndPasswordEvent(this.email, this.password);

  @override
  List<Object?> get props => [email,password];

}

class RegisterWithEmailAndPasswordEvent extends AuthEvent{
final  String email;
final  String password;
final  String phone;
final  String name;

  const RegisterWithEmailAndPasswordEvent({required this.email,required this.password,required this.name, required this.phone});

  @override
  List<Object?> get props => [email,password];

}
