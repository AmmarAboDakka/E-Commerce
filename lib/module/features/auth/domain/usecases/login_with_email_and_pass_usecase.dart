import 'package:e_commerce/module/features/auth/domain/repositories/auth_repository.dart';

import '../entities/login.dart';

class LoginInWithEmailAndPasswordUseCase{

  /// Dependancy Injection 
 final Authrepository authrepository;

  LoginInWithEmailAndPasswordUseCase(this.authrepository);

  Future<Login>loginInWithEmailAndPassword(LoginParam loginParam) async {
    
    return await authrepository.loginInWithEmailAndPassword(loginParam);
  }

}