import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';

import '../componentes/colocar_botao.dart';
import '../componentes/colocar_texto.dart';

class TelaAcoes extends StatefulWidget {
  const TelaAcoes({super.key});

  @override
  State<TelaAcoes> createState() => _TelaAcoesState();
}

class _TelaAcoesState extends State<TelaAcoes> {
  double ibo = 0;
  double vaIbo = 0;
  double nas = 0;
  double vaNas = 0;
  double cac = 0;
  double vaCac = 0;
  double ifix = 0;
  double vaIfix = 0;
  double dow = 0;
  double vaDow = 0;
  double nik = 0;
  double vaNik = 0;

  hgFinance() async {
    final String urlHgFinance =
        'https://api.hgbrasil.com/finance?format=json-cors&key=91c8a08e';
    Response resposta = await get(Uri.parse(urlHgFinance));
    Map convercao = json.decode(resposta.body);
    setState(() {
      ibo = convercao['results']['stocks']['IBOVESPA']['points'];
      vaIbo = convercao['results']['stocks']['IBOVESPA']['variation'];
      nas = convercao['results']['stocks']['NASDAQ']['points'];
      vaNas = convercao['results']['stocks']['NASDAQ']['variation'];
      cac = convercao['results']['stocks']['CAC']['points'];
      vaCac = convercao['results']['stocks']['CAC']['variation'];
      ifix = convercao['results']['stocks']['IFIX']['points'];
      vaIfix = convercao['results']['stocks']['IFIX']['variation'];
      dow = convercao['results']['stocks']['DOWJONES']['points'];
      vaDow = convercao['results']['stocks']['DOWJONES']['variation'];
      nik = convercao['results']['stocks']['NIKKEI']['points'];
      vaNik = convercao['results']['stocks']['NIKKEI']['variation'];
    });
  }

  proximo() {
    Navigator.of(context).pushNamed('/telaBitcoin');
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
            child: ColocarTexto(texto: 'Ações'),
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
                        'IBOVESPA',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${ibo}'),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaIbo < 0
                                  ? Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaIbo}',
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
                        'NASDAQ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${nas}'),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaNas < 0
                                  ? Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaNas}',
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
                        'CAC',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${cac}'),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaCac < 0
                                  ? Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaCac}',
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
                        'IFIX',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${ifix}'),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaIfix < 0
                                  ? Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaIfix}',
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
                        'DOWJONES',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${dow}'),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaDow < 0
                                  ? Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaDow}',
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
                        'NIKKEI',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${nik}'),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaNik < 0
                                  ? Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaNik}',
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
            texto: 'Ir para BitCoins',
          )
        ],
      ),
    );
  }
}
