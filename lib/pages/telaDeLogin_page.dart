import 'package:flutter/material.dart';
import 'package:sistema_sacar/pages/telaDeSenha_page.dart';

class telaDeloginPage_page extends StatefulWidget {
  const telaDeloginPage_page({super.key});

  @override
  State<telaDeloginPage_page> createState() => _telaDeloginPage_pageState();
}

class _telaDeloginPage_pageState extends State<telaDeloginPage_page> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controleAgencia = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logar"),
        backgroundColor: Color.fromARGB(255, 43, 0, 160),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Por favor insira o cartão do banco\nou\ndigite o número da agência e conta",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 60, 49, 0)),
              ),
              contruirFormPrincipal(),
              Padding(padding: EdgeInsets.all(18)),
              OutlinedButton.icon(
                icon: Icon(
                  Icons.send,
                  size: 38,
                  color: Color.fromARGB(255, 43, 0, 160),
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(18),
                ),
                label: Text(
                  "Confirmar",
                  style: TextStyle(
                      color: Color.fromARGB(255, 43, 0, 160), fontSize: 30),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => telaDeSenha_page(),
                    ));
                  }
                },
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
          labelText: "Cartão ou numero de agência",
          labelStyle:
              TextStyle(color: Color.fromARGB(255, 43, 0, 160), fontSize: 30)),
      controller: controleAgencia,
      validator: (value) {
        if (value!.isEmpty) {
          return 'informe o numero de agência ou numero do cartão';
        }
        if (value.length <= 4) {
          return 'Deve conter mais de 4 letras';
        }
        if (value != "00000") {
          return 'Agência incorreta';
        }
        return null;
      },
    );
  }
}
