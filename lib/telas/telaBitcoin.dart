import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';

import '../componentes/colocar_botao.dart';
import '../componentes/colocar_texto.dart';

class TelaBitcoin extends StatefulWidget {
  const TelaBitcoin({super.key});

  @override
  State<TelaBitcoin> createState() => _TelaBitcoinState();
}

class _TelaBitcoinState extends State<TelaBitcoin> {
  double block = 0;
  double vaBlock = 0;
  double bit = 0;
  double vaBit = 0;
  double bitcoin = 0;
  double vaBitcoin = 0;
  double coin = 0;
  double vaCoin = 0;
  double fox = 0;
  double vaFox = 0;

  hgFinance() async {
    final String urlHgFinance =
        'https://api.hgbrasil.com/finance?format=json-cors&key=91c8a08e';
    Response resposta = await get(Uri.parse(urlHgFinance));
    Map convercao = json.decode(resposta.body);
    setState(() {
      block = convercao['results']['bitcoin']['blockchain_info']['buy'];
      vaBlock = convercao['results']['bitcoin']['blockchain_info']['variation'];
      bit = convercao['results']['bitcoin']['bitstamp']['buy'];
      vaBit = convercao['results']['bitcoin']['bitstamp']['variation'];
      bitcoin = convercao['results']['bitcoin']['mercadobitcoin']['buy'];
      vaBitcoin =
          convercao['results']['bitcoin']['mercadobitcoin']['variation'];
      coin = convercao['results']['bitcoin']['coinbase']['last'];
      vaCoin = convercao['results']['bitcoin']['coinbase']['variation'];
      fox = convercao['results']['bitcoin']['foxbit']['last'];
      vaFox = convercao['results']['bitcoin']['foxbit']['variation'];
    });
  }

  proximo() {
    Navigator.of(context).pushNamed('/telaInicial');
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
            child: ColocarTexto(texto: 'BitCoin'),
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
                        'Blockchain.info',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${block}'),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaBlock < 0
                                  ? const Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaBlock}',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'BitStamp',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${bit}'),
                          const SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaBit < 0
                                  ? Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaBit}',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Mercado BitCoin',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${bitcoin}'),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaBitcoin < 0
                                  ? const Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaBitcoin}',
                              style: const TextStyle(
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
                  const SizedBox(width: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CoinBase',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${coin}'),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaCoin < 0
                                  ? Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaCoin}',
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
                        'FoxBit',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 151, 148, 148),
                        ),
                      ),
                      Row(
                        children: [
                          Text('${fox}'),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: vaFox < 0
                                  ? Color.fromARGB(255, 252, 0, 0)
                                  : Colors.blue,
                            ),
                            child: Text(
                              '${vaFox}',
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
