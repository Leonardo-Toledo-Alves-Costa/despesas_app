import 'package:despesas_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  const DespesasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
    HomePage({super.key});

    final titleController = TextEditingController();
    final valueController = TextEditingController();

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[ 
          Container(
            child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Gráfico 1'),
            ),
          ),
            Column(
              children: _transactions.map((tr){
                return Card(
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.black, width: 1))),
                        padding: EdgeInsets.all(10),
                        child: Text('R\$${tr.price.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(child: Text(tr.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                        ),
                        Container(child: Text(DateFormat('d MMM y').format(tr.date), style: TextStyle(fontSize: 15, color: Colors.grey[700]),)
                        )
                      ],
                  )
                ],
              )
            );}).toList(),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'Título da transação', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  TextField(
                    controller: valueController,
                    decoration: InputDecoration(labelText: 'Valor em R\$', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(titleController.text);
                      print(valueController.text);
                    },
                    child: Text('Adicionar transação', style: TextStyle(color: Colors.black),), 
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
} 