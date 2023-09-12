import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.currentListExpenses});

  final List<Expense> currentListExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          currentListExpenses.length, // the amount of the list will be rendered
      itemBuilder: (ctx, index) => ExpensesItem(currentListExpenses[index]),
    );
  }
}
