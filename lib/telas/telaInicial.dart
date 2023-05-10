import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prova_pratica_flutter/componentes/colocar_botao.dart';
import 'package:prova_pratica_flutter/componentes/colocar_texto.dart';
import 'package:http/http.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  double dolar = 0;
  double vaDolar = 0;
  double euro = 0;
  double vaEuro = 0;
  double peso = 0;
  double vaPeso = 0;
  double yem = 0;
  double vaYem = 0;

  hgFinance() async {
    final String urlHgFinance =
        'https://api.hgbrasil.com/finance?format=json-cors&key=91c8a08e';
    Response resposta = await get(Uri.parse(urlHgFinance));
    Map convercao = json.decode(resposta.body);
    setState(() {
      dolar = convercao['results']['currencies']['USD']['buy'];
      vaDolar = convercao['results']['currencies']['USD']['variation'];
      euro = convercao['results']['currencies']['EUR']['buy'];
      vaEuro = convercao['results']['currencies']['EUR']['variation'];
      peso = convercao['results']['currencies']['ARS']['buy'];
      vaPeso = convercao['results']['currencies']['ARS']['variation'];
      yem = convercao['results']['currencies']['JPY']['buy'];
      vaYem = convercao['results']['currencies']['JPY']['variation'];
    });
  }

  proximo() {
    Navigator.of(context).pushNamed('/telaAcoes');
  }

  @override
  Widget build(BuildContext context) {
    hgFinance();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 75, 31),
        title: const Text(
          'Finanças de Hoje',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: ColocarTexto(texto: 'MOEDAS'),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(20.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 161, 161, 161),
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dólar',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${dolar}'),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaDolar < 0
                                  ? Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaDolar}',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Peso',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${peso}'),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaPeso < 0
                                  ? Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaPeso}',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Euro',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${euro}'),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaEuro < 0
                                  ? Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaEuro}',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Yen',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${yem}'),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaYem < 0
                                  ? Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaYem}',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Botao(
            corFonte: Colors.white,
            corFundo: Color.fromARGB(255, 45, 92, 55),
            funcao: proximo,
            texto: 'Ir para Ações',
          )
        ],
      ),
    );
  }
}
