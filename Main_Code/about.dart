import 'package:flutter/material.dart';



class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(title: const Text("About"), centerTitle: true),
      // Body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            // App Description Header
            Card(
              color: Colors.green,
              child: SizedBox(
                height: 50,
                child: const Center(
                  child: Text(
                    "App Description",
                    style: TextStyle(color: Colors.white),
                    
                   
                  ),
                ),
              ),
            ),
             const SizedBox(height: 16),

              // App Description
               Card(
              color: Colors.white,
              child: SizedBox(
                height: 150,
                child: const Center(
                  child: Text(
                    "This application is an Expense Tracker, it was made as a way to manage future expenses whenever they get very large, this app allows users to track their daily, weekly and monthly expendetures and budget accordingly.",
                    style: TextStyle(color: Colors.black),
                  )
                )
              )
               ),

              const SizedBox(height: 32),

              //Ethcial AI usage header
              Card(
              color: Colors.red,
              child: SizedBox(
                height: 50,
                child: const Center(
                  child: Text(
                    "Ethical AI usage statement ",
                    style: TextStyle(color: Colors.white),
                    
                   
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            //Ethcial AI usage Statement
             Card(
              color: Colors.white,
              child: SizedBox(
                height: 70,
                child: const Center(
                  child: Text(
                    "All AI usage within this project was done ethcially, to debug code and gain clarificton on concepts",
                    style: TextStyle(color: Colors.black),
                  )
                )
              )
               ),

               const SizedBox(height: 32),

              //Reflection header
              Card(
              color: Colors.blue,
              child: SizedBox(
                height: 50,
                child: const Center(
                  child: Text(
                    "Student Reflection Summary ",
                    style: TextStyle(color: Colors.white),
                    
                   
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            //Ethcial AI usage Statement
             Card(
              color: Colors.white,
              child: SizedBox(
                height: 80,
                child: const Center(
                  child: Text(
                    "Overall this project has helped me get better with the flutter and dart by Introducing me to new concepts within the framework",
                    style: TextStyle(color: Colors.black),
                  )
                )
              )
               ),
             
  //           const Text (
  //           'This application is an Expense Tracker, it was made as a way to manage future expenses whenever they get very large, this app allows users to track their daily, weekly and monthly expendetures and budget accordingly',
  //           overflow: TextOverflow.ellipsis,
  // ),
            
          ],
        ),
      ),
    );
  }
}
