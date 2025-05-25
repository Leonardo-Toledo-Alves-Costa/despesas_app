import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: transactions.isEmpty ? Column(
        children: [
          SizedBox(height: 20,),
          Text('Nenhuma transação cadastrada por enquanto!', style: TextStyle(fontSize: 16),),
          SizedBox(height: 20,),
          SizedBox(
            height: 200,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,))
        ],
      ): 
      ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
        final tr = transactions[index];
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
                    ),
                  ],
                ),
              ],            
            ),
          );
        },
      ),
    );
  }
}