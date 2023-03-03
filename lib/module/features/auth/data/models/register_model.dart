// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:e_commerce/module/features/auth/domain/entities/register.dart';

class RegisterModel extends Register {

  const RegisterModel(
      {required super.status,
       required super.message,
        required super.data});

  RegisterModel copyWith({
    bool? status,
    String? message,
    RegisterDataModel? data,
  }) {
    return RegisterModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      status: map['status'] as bool,
      message: map['message'] as String,
      data: RegisterDataModel.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RegisterModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant RegisterModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class RegisterDataModel extends RegisterData {
  const RegisterDataModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.phone,
      required super.image,
      required super.token});

  RegisterDataModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? image,
    String? token,
  }) {
    return RegisterDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'token': token,
    };
  }

  factory RegisterDataModel.fromMap(Map<String, dynamic> map) {
    return RegisterDataModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      image: map['image'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterDataModel.fromJson(String source) =>
      RegisterDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterDataModel(id: $id, name: $name, email: $email, phone: $phone, image: $image, token: $token)';
  }

  @override
  bool operator ==(covariant RegisterDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.image == image &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        image.hashCode ^
        token.hashCode;
  }
}
