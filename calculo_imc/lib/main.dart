import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Calculadora IMC', home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var primaryColor = Colors.pink[400];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          backgroundColor: primaryColor,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_pin,
              color: primaryColor,
              size: 100.0,
              semanticLabel: 'Person outline icon',
            ),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso em KG',
                labelStyle: TextStyle(
                  color: primaryColor,
                ),
              ),
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24.0
              ),
            ),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura em CM',
                labelStyle: TextStyle(
                  color: primaryColor,
                ),
              ),
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24.0
              ),
            )
          ],
        )
    );
  }
}
