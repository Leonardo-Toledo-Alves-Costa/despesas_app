import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 750,
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
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            'R\$${tr.price}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
               ),
               trailing: Icon(Icons.delete),
               iconColor: Theme.of(context).disabledColor,
               onTap: () => onRemove(tr.id)
            ),
          );
        },
      ),
    );
  }
}