// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_commerce/module/features/auth/domain/entities/login.dart';
import 'package:e_commerce/module/features/auth/domain/entities/register.dart';

abstract class Authrepository{

Future<Login>loginInWithEmailAndPassword(LoginParam loginParam);

Future<Register>registerInWithEmailAndPassword(RegisterParam registerParam);

}

class LoginParam {
String email;
String password;
  LoginParam({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginParam.fromMap(Map<String, dynamic> map) {
    return LoginParam(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

 
}

class RegisterParam {

  String name;
  String password;
  String email;
  String phone;
  RegisterParam({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
  });
}
