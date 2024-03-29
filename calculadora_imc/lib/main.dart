import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seus dados";

  void _calculate(){

    setState(() {
      double weight = double.parse( weightController.text );
      double height = double.parse( heightController.text ) / 100;
      double imc = weight / (height * height);

      if( imc < 17.0 ){
        _infoText = "Muito Abaixo do peso ";
      }else if( imc >= 17.0 && imc <= 18.49  ){
        _infoText = "Abaixo do peso ";
      }else if( imc >= 18.5 && imc <= 24.99  ){
        _infoText = "Acima do peso ";
      }else if( imc >= 30.0 && imc <= 34.99  ){
        _infoText = "Obesidade I ";
      }else if( imc >= 35.0 && imc <= 39.99  ){
        _infoText = "Obesidade II (severa)";
      }else{
        _infoText = "Obesidade III (mórbida) ";
      }

      _infoText = _infoText + "${imc.toStringAsPrecision(4)}";

    });
  }

  void _resetFields(){
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _infoText = "Informe seus dados";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
          Text("Calculadora de IMC"),
          centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields
            )

        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color: Colors.green),
            TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (Kg):",
                    labelStyle: TextStyle(color: Colors.green)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color:Colors.green, fontSize: 25.0),
              controller: weightController,
            ),
            TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm):",
                    labelStyle: TextStyle(color: Colors.green)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color:Colors.green, fontSize: 25.0),
                controller: heightController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child:Container(
                  height: 50.0,
                  child: RaisedButton(
                      onPressed: _calculate,
                    child: Text("Calcular", style: TextStyle(color:Colors.white, fontSize: 25.0)),
                    color: Colors.green
                  ),
                ),
            ),
            Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0)
            )
          ],
        )
      )
    );
  }
}
