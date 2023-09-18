import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController =
      TextEditingController(); // it's another way to set value from user
  final _amountController = TextEditingController();

  void _presentDatePicker() {
    // future is like async await / promises in javascript
    final now = DateTime.now();
    final firsDate = DateTime(now.year - 1, now.month, now.day);
    // returns a future
    showDatePicker(
            context: context,
            initialDate: now,
            firstDate: firsDate,
            lastDate: now)
        .then(
      (value) {
        print(value);
      },
    );
  }

  @override
  void dispose() {
    // we need to make that to not persist in memory
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // controller -> value and set the value at the same time
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              // we need to use it here
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              // we need to use it here
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Selected Date'),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: const Text('Save Expense'))
            ],
          )
        ],
      ),
    );
  }
}
