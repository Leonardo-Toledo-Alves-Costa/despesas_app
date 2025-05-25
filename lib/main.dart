import 'package:despesas_app/components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:despesas_app/models/transaction.dart';


void main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  const DespesasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    final _transactions = [
    Transaction(
      id: 'C1', 
      title: 'Mouse Gamer', 
      price: 274.45, 
      date: DateTime.now()
      ),
      Transaction(
      id: 'C2', 
      title: 'Toninho', 
      price: 150.50, 
      date: DateTime.now())
  ];

    _addTransaction(String title, double price){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title, 
      price: price, 
      date: DateTime.now()
    );

  setState(() {
    _transactions.add(newTransaction);
    });
  }


_openTransactionFormModal(BuildContext context){
  showModalBottomSheet(
  context: context,
  builder: (_) {
      return TransactionForm(_addTransaction);
    },
  );
}

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
      TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.add_card),
      onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
} 