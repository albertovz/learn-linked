import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/register/register_event.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/register/widgets/register_content.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterEvent vm = Provider.of<RegisterEvent>(context);
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: RegisterContent(vm),
    );
  }
}