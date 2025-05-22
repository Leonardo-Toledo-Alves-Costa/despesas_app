
import 'package:flutter/material.dart';

void main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  const DespesasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
        'Despesas Pessoais',
        style: TextStyle(fontSize: 25, color: Colors.white)
           ),
      backgroundColor: Colors.blue,
      ), 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[ 
          Container(
            child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Gráfico 1'),
            ),
          ),
        Card(
                color: Colors.red,
                elevation: 5,
                child: Text('Lista de despesas'),
          )
        ]
      ),
    );
  }
} 