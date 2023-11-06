import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/home/home_state.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/validation_item.dart';

class HomeEvent extends ChangeNotifier {

  HomeState _state = HomeState();

  HomeState get state => _state;

  register () {
    if (_state.isValid()) {
      print('Valores del formulario: ${_state.email.value}');
      print('Valores del formulario: ${_state.username.value}');
      print('Valores del formulario: ${_state.password.value}');
      print('Valores del formulario: ${_state.confirmPassword.value}');
    } else {
      print('Formulario no válido');
    }
  }

  changeEmail (String value) {
    final bool emailFormatValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);

    if (!emailFormatValid) {
      _state = _state.copyWith(email: const ValidationItem(error: 'No es un email válido'));
    } else if (value.length >= 6) {
      _state = state.copyWith(email: ValidationItem(value: value, error: ''));
    } else {
      _state = state.copyWith(email: const ValidationItem(error: 'Al menos 6 carácteres'));
    }
    notifyListeners();
  }

  changeUsername(String value) {
    if( value.length >= 3) {
      _state = state.copyWith(username: ValidationItem(value: value, error: ''));
    } else {
      _state = state.copyWith(username: const ValidationItem(error: 'Al menos 3 carácteres'));
    }
    notifyListeners();
  }

  changePassword(String value) {
    if( value.length >= 6) {
      _state = state.copyWith(password: ValidationItem(value: value, error: ''));
    } else {
      _state = state.copyWith(password: const ValidationItem(error: 'Al menos 6 carácteres'));
    }
    notifyListeners();
  }

  changeConfirmPassword(String value) {
    if( value.length >= 6) {
      _state = state.copyWith(confirmPassword: ValidationItem(value: value, error: ''));
    } else {
      _state = state.copyWith(confirmPassword: const ValidationItem(error: 'Al menos 6 carácteres'));
    }
    notifyListeners();
  }

}