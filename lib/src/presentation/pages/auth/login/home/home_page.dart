import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/home/home_event.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/home/widgets/home_content.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    HomeEvent vm = Provider.of<HomeEvent>(context);

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: HomeContent(vm),
    );
  }
}