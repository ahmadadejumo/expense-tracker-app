// ignore_for_file: use_key_in_widget_constructors, unused_element

import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import "../models/transaction.dart";

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "t1",
      title: "New Books",
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Transport Fare",
      amount: 65.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransactions(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransactions),
        TransactionList(_userTransactions)
      ],
    );
  }
}
