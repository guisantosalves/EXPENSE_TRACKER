import 'package:flutter/material.dart';

import '../model/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 200, 200, 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 1),
            Row(children: [
              Text('R\$${expense.amount.toStringAsFixed(2)}'),
              const Spacer(), // fill all the space it can gets
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(width: 8),
                  Text(expense.formattedDate)
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
