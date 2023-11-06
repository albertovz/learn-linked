import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/injection.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/home/home_event.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/home/home_page.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/login_event.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/login_page.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/register/register_event.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/register/register_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginEvent(locator<AuthUseCases>())),
        ChangeNotifierProvider(create: (context) => RegisterEvent()),
        ChangeNotifierProvider(create: (context) => HomeEvent())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login' : (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => const RegisterPage(),
          'home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}