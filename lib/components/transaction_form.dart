import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm(this.onSubmit, {super.key});

   final void Function(String title, double price, DateTime) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
    final _titleController = TextEditingController();

    final _priceController = TextEditingController();
    DateTime? _selectedDate = DateTime.now();

    _submitForm(){
    final title = _titleController.text;
    final price = double.tryParse(_priceController.text) ?? 0;
  if(title.isEmpty || price <= 0 || _selectedDate == null){
    return;
  }
    widget.onSubmit(title, price, _selectedDate!);
    
  }

  _showDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2020), 
      lastDate: DateTime.now()
      ).then((pickedDate){
        if(pickedDate == null){
          return;
        }
      setState(() {
        _selectedDate = pickedDate;
      });
      });
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
                    controller: _titleController,
                    onSubmitted: (_) => _submitForm(),
                    decoration: InputDecoration(labelText: 'Título da transação', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitForm(),
                    decoration: InputDecoration(labelText: 'Valor em R\$', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
            SizedBox(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                  child: Text(
                    _selectedDate == null
                    ? 'Nenhuma data selecionada!'
                    : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate!)}',
                  )
                ),
                  TextButton(
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.grey)),
                    onPressed: _showDatePicker,
                    child: const Text(
                      'Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:  Colors.black
                      ),
                    ),
                  )
                ],
              ),
            ), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _submitForm();
                        },
                        child: Text('Adicionar transação', style: TextStyle(color: Colors.black),), 
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}