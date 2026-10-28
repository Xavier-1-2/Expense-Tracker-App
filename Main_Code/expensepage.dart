import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
final Map<String, String>? existingExpense;
const ExpensePage({super.key, this.existingExpense});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  String name = "";
  String amount = "";
  String? freq;

  List<Map<String, String>> expenses = [];
//    String dropdownValue = list.first;
//     final List<String> _exptypes = ['Yearly', 'Monthly', 'Fortnightly', 'Daily'];
//     String? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(title: const Text("Add Expense"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //Expense Name Field
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Add Expense Name",
                ),
              
              onChanged: (val) => name = val
            ),

            const SizedBox(height: 16),
            //Expense Amount Field
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Add Expense Amount",
              
              ),
              keyboardType: TextInputType.number,
               onChanged: (val) => amount = val,
            ),
            
             const SizedBox(height: 16),
            
            //Dropdown
             DropdownButton<String>(
              value: freq,
              hint: const Text("Frequency"),
              items: ['Yearly', 'Monthly', 'Fortnightly', 'Weekly', 'Daily']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => freq = val),
            ),
         
          //Add Expense Button
           ElevatedButton(
              onPressed: () {
                if (name != "" && amount != "" && freq != null) {

                  Map<String, String> newExpense = {
                    "name": name,
                    "amount": amount,
                    "freq": freq!,
                  };

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Expense Added"),
                    ),
                  );

                  Navigator.pop(context, newExpense);
                }
              },
              child: const Text("Add Expense"),
            )
                  ],
                  ),
                  ),
                  );
  }
}
