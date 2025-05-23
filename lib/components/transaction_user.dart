import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
   TransactionUser({super.key});

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
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(widget._transactions),
        TransactionForm(),
      ],
    );
  }
}