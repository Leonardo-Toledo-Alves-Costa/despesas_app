import 'package:despesas_app/components/transaction_user.dart';
import 'package:flutter/material.dart';


void main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  const DespesasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[ 
            SizedBox(
              child: Card(
                  color: Colors.blue,
                  elevation: 5,
                  child: Text('Gráfico 1'),
              ),
            ),
            TransactionUser(),
          ],
        ),
      )
    );
  }
} 