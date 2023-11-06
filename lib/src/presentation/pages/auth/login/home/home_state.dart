import 'package:flutter_gamer_mvvm/src/presentation/utils/validation_item.dart';

class HomeState {
  ValidationItem email;
  ValidationItem password;
  ValidationItem username;
  ValidationItem confirmPassword;

  HomeState(
      {this.username = const ValidationItem(),
      this.email = const ValidationItem(),
      this.password = const ValidationItem(),
      this.confirmPassword = const ValidationItem()});

  bool isValid() {
    if (username.value.isEmpty ||
        username.error.isNotEmpty ||
        email.value.isEmpty ||
        email.error.isNotEmpty ||
        password.value.isEmpty ||
        password.error.isNotEmpty ||
        confirmPassword.value.isEmpty ||
        confirmPassword.error.isNotEmpty ||
        (password.value != confirmPassword.value)
        ) {
          return false;
        }
      return true;
  }

  HomeState copyWith ({
    ValidationItem? username,
    ValidationItem? email,
    ValidationItem? password,
    ValidationItem? confirmPassword
  }) => HomeState(
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword
  );
}
