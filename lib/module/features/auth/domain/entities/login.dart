import 'package:equatable/equatable.dart';

class Login extends Equatable {

  final bool status;

  final String message;

  final LoginData data;

 const Login({required this.status,required this.message, required this.data});
  
  @override
  
  List<Object?> get props => [status,message,data];
}

class LoginData extends Equatable {

  final int id;

  final String name;

  final String email;

  final String phone;

  final String image;

  final String token;

  const LoginData({required this.id,  required this.name, required this.email,required this.image,required this.token,required this.phone});
  
  @override
  
  List<Object?> get props => [id,name,email,image,token];
}
