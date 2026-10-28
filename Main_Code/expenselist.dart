import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  final List<Map<String, String>> expenses;
  final Function(int) onDelete;
  final Function(int) onUpdate;

  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onDelete,
    required this.onUpdate, 
  });

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Expenses")),
      body: ListView.builder(
        itemCount: widget.expenses.length,
        itemBuilder: (context, index) {
          final e = widget.expenses[index];

    // Main Card Wrap
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 3,
      child: ListTile(
        title: Text(e['name'] ?? ''),
        subtitle: Text(e['freq'] ?? ''),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("\$${e['amount'] ?? '0'}"),

            // Update Button
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                widget.onUpdate(index);
              },
            ),

            // Delete Button
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                widget.onDelete(index);
                setState(() {}); 
              },
                  ),
                  ],
                  ),
                  ),
                  );
        },
                  ),
                  );
  }
}