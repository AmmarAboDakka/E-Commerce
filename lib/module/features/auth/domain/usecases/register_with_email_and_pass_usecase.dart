import 'package:e_commerce/module/features/auth/domain/entities/register.dart';
import 'package:e_commerce/module/features/auth/domain/repositories/auth_repository.dart';

class RegisterInWithEmailAndPassworduseCase{
  //Dep Injection
  final Authrepository authrepository;

  RegisterInWithEmailAndPassworduseCase(this.authrepository);

 Future<Register>registerInWithEmailAndPassword(RegisterParam registerParam)async {

  return await authrepository.registerInWithEmailAndPassword(registerParam);
 }
}