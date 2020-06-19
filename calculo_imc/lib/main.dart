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

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados!";

  void _resetFields () {
    setState(() {
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
    weightController.text = "";
    heightController.text = "";
  }

  void _calcular() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        _infoText = "Abaixo do peso: ${imc.toStringAsPrecision(3)}";
      } else if ( imc < 24.9 && imc >= 18.6 ) {
        _infoText = "Peso Ideal: ${imc.toStringAsPrecision(3)}";
      } else if ( imc < 29.9 && imc >= 24.9 ) {
        _infoText = "Levemente acima do peso: ${imc.toStringAsPrecision(3)}";
      } else if ( imc < 34.9 && imc >= 29.9 ) {
        _infoText = "Obesidade grau I: ${imc.toStringAsPrecision(3)}";
      } else if ( imc < 39.9 && imc >= 34.9 ) {
        _infoText = "Obesidade grau II: ${imc.toStringAsPrecision(3)}";
      } else if ( imc >= 40.0 ) {
        _infoText = "Obesidade grau III: ${imc.toStringAsPrecision(3)}";
      }
    }); 
  }

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
              onPressed: _resetFields,
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 50,),
                Icon(
                  Icons.person_pin,
                  color: primaryColor,
                  size: 100.0,
                  semanticLabel: 'Person outline icon',
                ),
                TextFormField(
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
                      fontSize: 20.0),
                  controller: weightController,
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Insira seu peso.";
                    } else return null;
                  },
                ),
                TextFormField(
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
                      fontSize: 20.0),
                  controller: heightController,
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Insira sua altura.";
                    } else return null;
                  },
                ),
                SizedBox(height: 30,),
                Container(
                    height: 50.0,
                    color: primaryColor,
                    child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          _calcular();
                        }
                      },
                      child: Text(
                        'Calcular',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22.0),
                      ),
                      color: primaryColor,
                    )
                ),
                SizedBox(height: 10,),
                Text(
                  '$_infoText',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
                )
              ],
            ),
          )
        )
    );
  }
}
