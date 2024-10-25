import 'package:dartz/dartz.dart';
import 'package:lista_harry_potter_mejorada/data/datasources/character_remote_datasource.dart';
import 'package:lista_harry_potter_mejorada/domain/entities/character.dart';
import 'package:lista_harry_potter_mejorada/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
 final CharacterRemoteDataSource remoteDataSource;

 CharacterRepositoryImpl(this.remoteDataSource);

 @override
 Future<Either<Exception, List<Character>>> getAllCharacters() async {
   try {
     final characterModels = await remoteDataSource.getAllCharacters();
     return Right(characterModels
         .map((model) => Character(
             name: model.name, house: model.house, image: model.image, dateOfBirth: model.dateOfBirth, species: model.species))
         .toList());
   } catch (e) {
     return Left(Exception('Error al cargar personajes'));
   }
 }
}