import 'package:dartz/dartz.dart';
import 'package:lista_harry_potter_mejorada/domain/entities/user.dart';
import 'package:lista_harry_potter_mejorada/domain/repositories/login_repository.dart';

class LoginUser {
 final LoginRepository repository;

 LoginUser(this.repository);

 Future<Either<Exception, User>> call(String email, String password) async {
   return await repository.login(email, password);
 }
}