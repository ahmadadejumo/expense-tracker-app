// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace, deprecated_member_use
import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  "No Transactions Added Yet!",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      "./assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: FittedBox(
                        child: Text("\$${transactions[index].amount}"),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          onPressed: () => deleteTx(transactions[index].id),
                          icon: Icon(Icons.delete),
                          label: Text("Delete"),
                          textColor: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          onPressed: () => deleteTx(transactions[index].id),
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                        ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
