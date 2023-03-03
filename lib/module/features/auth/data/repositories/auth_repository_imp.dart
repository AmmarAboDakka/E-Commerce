import 'package:e_commerce/module/features/auth/data/datasources/auth_remote_data_sourse.dart';
import 'package:e_commerce/module/features/auth/domain/entities/login.dart';
import 'package:e_commerce/module/features/auth/domain/entities/register.dart';
import 'package:e_commerce/module/features/auth/domain/repositories/auth_repository.dart';

class AuthrepositoryImp extends Authrepository {
  
  final AuthRemoteDataSource remoteDataSource;

  AuthrepositoryImp(this.remoteDataSource);
  @override
  Future<Login> loginInWithEmailAndPassword(LoginParam loginParam) async {
    final result = await remoteDataSource.loginWithEmailAndPassword(loginParam);
    return result;
  }

  @override
  Future<Register> registerInWithEmailAndPassword(
      RegisterParam registerParam) async {
    final response =
        await remoteDataSource.registerInWithEmailAndPassword(registerParam);
    return response;
  }
}
