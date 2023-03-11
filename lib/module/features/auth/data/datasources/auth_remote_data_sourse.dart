
import 'package:e_commerce/core/api/end_point.dart';
import 'package:e_commerce/module/features/auth/data/models/register_model.dart';

import 'package:e_commerce/module/features/auth/domain/repositories/auth_repository.dart';

import '../../../../../core/api/api_consumer.dart';
import '../models/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> loginWithEmailAndPassword(LoginParam login);
  Future<RegisterModel> registerInWithEmailAndPassword(
      RegisterParam registerParam);
}

///for API

class AuthRemoteDataSourceImplementationWithApi extends AuthRemoteDataSource {
  final ApiCounsumer apiCounsumer;

  AuthRemoteDataSourceImplementationWithApi(this.apiCounsumer);

  @override
  Future<LoginModel> loginWithEmailAndPassword(LoginParam login) async {
    final response = await apiCounsumer.post(
      EndPoint.login,
      body: login.toMap(),
    );
    return LoginModel.fromJson(response.data);
  }
  
  @override
  Future<RegisterModel> registerInWithEmailAndPassword(RegisterParam registerParam)async {
    final  response= await apiCounsumer.post(EndPoint.register,
    body: registerParam.toMap()
    );
    return RegisterModel.fromJson(response.data);
  }
  
 
}

