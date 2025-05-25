import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              children: transactions.map((tr){
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
        ]
     );
  }
}