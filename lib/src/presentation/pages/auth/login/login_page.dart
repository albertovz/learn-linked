import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/login_event.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/widgets/login_content.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    LoginEvent vm = Provider.of<LoginEvent>(context);

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: LoginContent(vm),
    );
  }
}