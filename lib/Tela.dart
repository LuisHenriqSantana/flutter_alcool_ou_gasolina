import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Tela extends StatefulWidget {

  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){

    double precoAlcool = double.tryParse( _controllerAlcool.text );
    double precoGasolina = double.tryParse( _controllerGasolina.text );

    if( precoAlcool == null || precoGasolina == null ){
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.) ";
      });
    }else{

      if( (precoAlcool / precoGasolina) >= 0.7 ){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
        });
      }

      //_limparCampos();

    }


  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Alcool Ou Gasolina',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),

      body: Container(

        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              Image.asset('images/logo.png',width: 350, height: 200,),
              SizedBox(height: 30,),
              Text('Saiba qual a melhor opção para abastecimento seu carro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(32),
                child: TextField(
                  style: TextStyle(
                    fontSize: 27,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço do alcool (Ex:1,59)"
                  ),
                  controller: _controllerAlcool,

                ),
              ),
              Padding(
                padding: EdgeInsets.all(32),
                child: TextField(
                  style: TextStyle(
                    fontSize: 27,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço da gasolina (Ex:3,15)"
                  ),
                  controller: _controllerGasolina,
                ),
              ),
              RaisedButton(
                  color: Colors.blue,
                  child: Text("Calcular",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  padding: EdgeInsets.all(15),
                  onPressed: _calcular
              ),
              Padding(
                padding: EdgeInsets.all(32),
                child: Text(_textoResultado,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),),
              ),

            ],
          ),
        )
      ),
    );
  }
}
