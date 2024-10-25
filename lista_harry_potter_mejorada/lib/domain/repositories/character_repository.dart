import 'package:dartz/dartz.dart';
import 'package:lista_harry_potter_mejorada/domain/entities/character.dart';

abstract class CharacterRepository {
 Future<Either<Exception, List<Character>>> getAllCharacters();
}