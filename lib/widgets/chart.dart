import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> rT;
  Chart(this.rT); // recentTransactions

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (var i = 0; i < rT.length; i++) {
        if (rT[i].date.day == weekDay.day &&
            rT[i].date.month == weekDay.month &&
            rT[i].date.year == weekDay.year) {
          totalSum += rT[i].amount;
        }
      }

      print(weekDay.toString());
      print(totalSum.toString());
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((data) {
          return Text('${data['day']} : ${data['amount']}');
        }).toList(),
      ),
    );
  }
}
