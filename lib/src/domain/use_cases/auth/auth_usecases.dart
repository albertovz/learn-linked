import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/login_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AuthUseCases {
  LoginUseCase login;

  AuthUseCases({required this.login});
}
