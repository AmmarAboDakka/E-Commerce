import 'package:e_commerce/core/api/dio_consumer.dart';
import 'package:e_commerce/core/api/end_point.dart';
import 'package:e_commerce/module/features/auth/data/models/register_model.dart';
import 'package:e_commerce/module/features/auth/domain/repositories/auth_repository.dart';

import '../models/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> loginWithEmailAndPassword(LoginParam login);
  Future<RegisterModel>registerInWithEmailAndPassword(RegisterParam registerParam);
}

///for API
class AuthRemoteDataSourceImplementationWithApi extends AuthRemoteDataSource {

  final DioConsumer dioConsumer;

  AuthRemoteDataSourceImplementationWithApi(this.dioConsumer);
  
  @override
  Future<LoginModel> loginWithEmailAndPassword(LoginParam login)async  {
    final response= await dioConsumer.post(EndPoint.login);
    return LoginModel.fromJson(response.data);
  }
  
  @override
  Future<RegisterModel> registerInWithEmailAndPassword(RegisterParam registerParam)async  {

    final response= await dioConsumer.post(EndPoint.register);
    
    return RegisterModel.fromJson(response.data);
  }
}
