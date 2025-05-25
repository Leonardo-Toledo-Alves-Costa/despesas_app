import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm(this.onSubmit, {super.key});

   final void Function(String title, double price) onSubmit;

    final titleController = TextEditingController();
    final priceController = TextEditingController();

    _submitForm(){
    final title = titleController.text;
    final price = double.tryParse(priceController.text) ?? 0;
  if(title.isEmpty || price <= 0){
    return;
  }
    onSubmit(title, price);
  }

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
                    onSubmitted: (_) => _submitForm(),
                    decoration: InputDecoration(labelText: 'Título da transação', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitForm(),
                    decoration: InputDecoration(labelText: 'Valor em R\$', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text('Adicionar transação', style: TextStyle(color: Colors.black),), 
                  )
                ],
              ),
            ),
          );
  }
}