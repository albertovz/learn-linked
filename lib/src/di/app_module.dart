import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gamer_mvvm/src/data/repository/auth_repository_impl.dart';
import 'package:flutter_gamer_mvvm/src/di/firesebase_service.dart';
import 'package:flutter_gamer_mvvm/src/domain/repository/auth_repository.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/login_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @preResolve
  Future<FirebaseService> get fireebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  // @Environment('repositories')
  // @injectable
  // AuthRepository get authRepository => AuthRepositoryImpl(firebaseAuth);

  // @Environment('use_cases')
  // @injectable
  // AuthUseCases get authUseCases =>
  //     AuthUseCases(login: LoginUseCase(authRepository));
}
