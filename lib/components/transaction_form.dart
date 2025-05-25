import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm(this.onSubmit, {super.key});

   final void Function(String title, double price) onSubmit;

    final titleController = TextEditingController();
    final priceController = TextEditingController();

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
                    controller: priceController,
                    decoration: InputDecoration(labelText: 'Valor em R\$', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final title = titleController.text;
                      final price = double.tryParse(priceController.text);
                      onSubmit(title, price!);
                    },
                    child: Text('Adicionar transação', style: TextStyle(color: Colors.black),), 
                  )
                ],
              ),
            ),
          );
  }
}