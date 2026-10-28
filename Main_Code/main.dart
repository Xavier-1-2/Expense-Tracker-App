import 'package:flutter/material.dart';
import 'expensepage.dart';
import 'expenselist.dart';
import 'about.dart';

void main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget 
{
  const myApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Expense Tracker',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.pink),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int _selectedIndex = 0;  

  // Expense List
  List<Map<String, String>> allExpenses = [];
  
  // Navigation to Expense Page
  void navigateToAE(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ExpensePage()),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        allExpenses.add(result); 
      });
    }
  }

  // Update Expense Function 
  void updateExpense(int index) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ExpensePage(
          existingExpense: allExpenses[index],
        ),
      ),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        allExpenses[index] = result; 
      });
    }
  }

  // Delete Expense Function
  void deleteExpense(int index) {
    setState(() {
      allExpenses.removeAt(index);
    });
  }

  // Navigate to Expense List Page
  void navigateToEL(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ExpenseList(
          expenses: allExpenses,
          onDelete: deleteExpense,
          onUpdate: updateExpense
        ),
      ),
    );
  } 

  // Navigate to About Page
  void navigateToAB(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(builder:(_){
        return About();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Appbar
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        centerTitle: true,
      ),

      body: Row(
        children: [

          // Navigation Rail
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });

              
              if (index == 0) {
                navigateToAE(context);
              }
              else if (index == 1) {
                navigateToEL(context);
              }
              else if (index == 2) {
                navigateToAB(context);
              }
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [

              NavigationRailDestination(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Icon(Icons.add),
                ),
                label: Text("Add Expense"),
              ),

              NavigationRailDestination(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Icon(Icons.list),
                ),
                label: Text("View Expenses"),
              ),

              NavigationRailDestination(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Icon(Icons.info),
                ),
                label: Text("About"),
              ),
            ],
                      ),

          //Rigth hand page
          const Expanded(
            child: Center(
              child: Text("Pick a Navigation Icon"),
            ),
          ),

        ],
      ),
    );
  }
}