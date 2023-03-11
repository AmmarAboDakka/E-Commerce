import 'package:e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/module/features/auth/domain/entities/register.dart';
import 'package:e_commerce/module/features/auth/domain/repositories/auth_repository.dart';

class RegisterWithEmailandPasswordUsecase extends Usecase<Register,RegisterParam>{

  final Authrepository authrepository;

  RegisterWithEmailandPasswordUsecase(this.authrepository);
  @override
  Future<Either<Failure, Register>> call(RegisterParam param)async  {
    return await authrepository.registerInWithEmailAndPassword(param);
  }

}