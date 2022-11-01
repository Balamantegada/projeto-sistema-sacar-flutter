import 'package:flutter/material.dart';

class telaDeSaque extends StatefulWidget {
  const telaDeSaque({super.key});

  @override
  State<telaDeSaque> createState() => _telaDeSaqueState();
}

class _telaDeSaqueState extends State<telaDeSaque> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controleValorDeSaque = TextEditingController();
  List sistema = [];
  int ValorEmCaixa = 2000;

  void functionSistema() {
    setState(() {
      ValorEmCaixa = ValorEmCaixa - int.parse(controleValorDeSaque.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Saque"),
        backgroundColor: Color.fromARGB(255, 43, 0, 160),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Por favor, digite o valor a ser sacado!",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 43, 0, 160))),
              contruirFormPrincipal(),
              Padding(padding: EdgeInsetsDirectional.all(20)),
              OutlinedButton.icon(
                icon: Icon(
                  Icons.ads_click,
                  size: 38,
                  color: Color.fromARGB(255, 43, 0, 160),
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(18),
                ),
                label: Text(
                  "Sacar",
                  style: TextStyle(
                      color: Color.fromARGB(255, 43, 0, 160), fontSize: 30),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    setState(() {
                      sistema.add(controleValorDeSaque.text);
                      functionSistema();
                    });
                  }
                },
              ),
              Padding(padding: EdgeInsetsDirectional.all(20)),
              Text(
                "O valor em caixa é: RS${ValorEmCaixa.toString()}!! \n e o registro de saques é \n ${sistema}",
                style: TextStyle(
                    color: Color.fromARGB(255, 43, 0, 160), fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  contruirFormPrincipal() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 30),
      decoration: InputDecoration(
          errorStyle: TextStyle(
            fontSize: 15.0,
          ),
          labelText: "Valor:",
          labelStyle:
              TextStyle(color: Color.fromARGB(255, 43, 0, 160), fontSize: 30)),
      controller: controleValorDeSaque,
      validator: (value) {
        if (value!.isEmpty) {
          return 'informe um valor';
        }
        if (int.parse(value) <= 0) {
          return "Informe um valor maior que 0";
        }
        if (int.parse(value) > ValorEmCaixa) {
          return "Valor de caixa é $ValorEmCaixa, Saldo insuficiente";
        }
        return null;
      },
    );
  }
}
