import 'package:flutter/material.dart';
import 'package:prova_pratica_flutter/telas/telaAcoes.dart';
import 'package:prova_pratica_flutter/telas/telaBitcoin.dart';
import 'package:prova_pratica_flutter/telas/telaInicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/telaInicial',
      routes: {
        '/telaInicial': (context) => TelaInicial(),
        '/telaAcoes': (context) => TelaAcoes(),
        '/telaBitcoin': (context) => TelaBitcoin(),
      },
    );
  }
}
