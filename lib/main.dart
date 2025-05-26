import 'package:despesas_app/components/chart.dart';
import 'package:despesas_app/components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:despesas_app/models/transaction.dart';


void main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  DespesasApp({super.key});
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: ThemeData.light().textTheme.copyWith(
          labelLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.white,
          secondary: Colors.blue,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    final List<Transaction> _transactions = [
  ];

    List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

    _addTransaction(String title, double price, DateTime date){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title, 
      price: price, 
      date: date,
    );

  setState(() {
    _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
}

  _removeTransaction(String id){
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }


  _openTransactionFormModal(BuildContext context) {
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
      Chart(_recentTransactions),
      TransactionList(_transactions, _removeTransaction),
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