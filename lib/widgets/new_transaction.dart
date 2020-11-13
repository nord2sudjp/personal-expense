import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _addTx;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this._addTx);

  void sbmtData() {
    //print(titleController.text);
    //print(amountController.text);

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    _addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => sbmtData(),
              //onChanged: (val) {titleInput = val;}
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => sbmtData(),

              //onChanged: (val) {
              //  amountInput = val;
              //}
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: sbmtData,
            ),
          ],
        ),
      ),
    );
  }
}
