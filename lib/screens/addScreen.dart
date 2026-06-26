import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.insert_emoticon),
        title: Text("Add Task"),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Container(
          color: Colors.amberAccent,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(30),
                child: TextField(
                controller: taskController,
                decoration: InputDecoration(
                  label: Text("Insert Task"),
                  border: InputBorder.none,
                ),
              ),
              ) , 
              Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: FloatingActionButton(
                  onPressed: () {
                    if (taskController.text.isNotEmpty) {
                      Navigator.pop(context); 
                    }
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
