import 'package:dartz/dartz.dart';
import 'package:lista_harry_potter_mejorada/domain/entities/user.dart';

abstract class LoginRepository {
 Future<Either<Exception, User>> login(String email, String password);
 Future<Either<Exception, bool>> isLoggedIn();
 Future<void> logout();
}