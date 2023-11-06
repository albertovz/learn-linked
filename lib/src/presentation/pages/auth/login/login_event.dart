import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/login_state.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/register/widgets/register_content.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/validation_item.dart';

class LoginEvent extends ChangeNotifier {
  //STATES
  LoginState _state = LoginState();
  Resource _response = Init();

  //GETTERS
  LoginState get state => _state;

  //USE CASES
  AuthUseCases _authUseCases;

  LoginEvent(this._authUseCases);

  //SETTERS
  void changeEmail(String value) {
    final bool emailFormatValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!emailFormatValid) {
      _state = _state.copyWith(
          email: const ValidationItem(error: 'No es un email válido'));
    } else if (value.length >= 6) {
      _state = _state.copyWith(email: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(
          email: const ValidationItem(error: 'Al menos 6 carácteres'));
    }

    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 6) {
      _state =
          _state.copyWith(password: ValidationItem(value: value, error: ''));
    } else {
      _state = _state.copyWith(
          password: const ValidationItem(error: 'Al menos 6 carácteres'));
    }

    notifyListeners();
  }

  void login() async {
    if (state.isValid()) {
      _response = Loading(); //ESperando la respuesta
      _response = await _authUseCases.login
          .launch(email: _state.email.value, password: _state.password.value);

      print('Data: $_response');
    } else {
      print('El formulario no es válido');
    }
  }
}
