import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/home/home_event.dart';

class HomeContent extends StatelessWidget {
  HomeEvent vm;

  HomeContent(this.vm);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: ListView(
        children: <Widget>[
          Rectangle(color: Colors.red, text: 'Grupos de estudio'),
          Rectangle(color: Colors.green, text: 'Chatbot'),
          Rectangle(color: Colors.blue, text: 'Materiales y recursos'),
          Rectangle(color: Colors.orange, text: 'Gestión de horarios'),
          Rectangle(color: Colors.purple, text: 'Perfil'),
        ],
      ),
    );
  }
}

class Rectangle extends StatelessWidget {
  final Color color;
  final String text;

  Rectangle({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: color,
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
