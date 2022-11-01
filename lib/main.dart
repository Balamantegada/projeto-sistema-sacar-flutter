//Código feito pro arthur L. kroenke, Sesi senai Itajai SC, 25/10/2022
import 'package:flutter/material.dart';
import 'package:sistema_sacar/pages/telaDeLogin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de banco (sacar)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Sistema de banco'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

MostrartelaDeSacar() {}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(255, 43, 0, 160),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => telaDeloginPage_page(),
                  ));
                },
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                icon: Icon(
                  Icons.attach_money_outlined,
                  size: 38,
                  color: Color.fromARGB(255, 43, 0, 160),
                ),
                label: Text(
                  "Sacar",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 43, 0, 160)),
                )),
            Padding(padding: EdgeInsetsDirectional.all(30)),
            Image.asset("assets/images/LogoEscolaSColorido.png", width: 200),
          ],
        ),
      ),
    );
  }
}
