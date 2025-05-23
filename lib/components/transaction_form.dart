import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
   TransactionForm({super.key});

    final titleController = TextEditingController();
    final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    },
                    child: Text('Adicionar transação', style: TextStyle(color: Colors.black),), 
                  )
                ],
              ),
            ),
          );
  }
}