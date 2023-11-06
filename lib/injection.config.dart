// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:flutter_gamer_mvvm/src/data/repository/auth_repository_impl.dart'
    as _i6;
import 'package:flutter_gamer_mvvm/src/di/app_module.dart' as _i9;
import 'package:flutter_gamer_mvvm/src/di/firesebase_service.dart' as _i4;
import 'package:flutter_gamer_mvvm/src/domain/repository/auth_repository.dart'
    as _i5;
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/auth_usecases.dart'
    as _i8;
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/login_usecase.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.FirebaseAuth>(() => appModule.firebaseAuth);
    await gh.factoryAsync<_i4.FirebaseService>(
      () => appModule.fireebaseService,
      preResolve: true,
    );
    gh.factory<_i5.AuthRepository>(
        () => _i6.AuthRepositoryImpl(gh<_i3.FirebaseAuth>()));
    gh.factory<_i7.LoginUseCase>(
        () => _i7.LoginUseCase(gh<_i5.AuthRepository>()));
    gh.factory<_i8.AuthUseCases>(
        () => _i8.AuthUseCases(login: gh<_i7.LoginUseCase>()));
    return this;
  }
}

class _$AppModule extends _i9.AppModule {}
