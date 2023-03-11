import 'package:e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/module/features/auth/domain/repositories/auth_repository.dart';

import '../entities/login.dart';

class LoginInWithEmailAndPasswordUseCase extends Usecase<Login, LoginParam> {
  /// Dependancy Injection
  final Authrepository authrepository;

  LoginInWithEmailAndPasswordUseCase(this.authrepository);

  @override
  Future<Either<Failure, Login>> call(LoginParam param) async {
    return await authrepository.loginInWithEmailAndPassword(param);
  }
}
