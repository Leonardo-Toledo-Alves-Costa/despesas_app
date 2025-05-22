
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
        'Despesas',
        style: TextStyle(fontSize: 28, color: Colors.white),
           ),
      backgroundColor: Colors.blue,
      ),
      body: Center(child: Text(
        'Começo da aplicação!',
        style: TextStyle(fontSize: 20),
        )
      ),
    );
  }
} 