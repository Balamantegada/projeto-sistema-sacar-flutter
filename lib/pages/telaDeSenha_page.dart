import 'package:flutter/material.dart';
import 'package:sistema_sacar/pages/telaDeSaque_page.dart';

class telaDeSenha_page extends StatefulWidget {
  const telaDeSenha_page({super.key});

  @override
  State<telaDeSenha_page> createState() => _telaDeSenha_pageState();
}

class _telaDeSenha_pageState extends State<telaDeSenha_page> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controleSenha = TextEditingController();
  var _contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Senha"),
        backgroundColor: Color.fromARGB(255, 43, 0, 160),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                          builder: (context) => telaDeSaque(),
                        ));
                      }
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  contruirFormPrincipal() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 30),
      obscureText: true,
      decoration: InputDecoration(
          errorStyle: TextStyle(
            fontSize: 15.0,
          ),
          labelText: "Senha",
          labelStyle:
              TextStyle(color: Color.fromARGB(255, 43, 0, 160), fontSize: 30)),
      controller: controleSenha,
      validator: (value) {
        if (_contador >= 4) {
          _contador++;
          return 'Quantidade limite de tentativas atingindo';
        }
        if (value!.isEmpty) {
          _contador++;
          return 'informe a senha';
        }

        if (value != "0") {
          _contador++;
          return 'Senha incorreta';
        }
        return null;
      },
    );
  }
}
