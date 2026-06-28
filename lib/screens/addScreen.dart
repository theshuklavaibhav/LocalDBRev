import 'package:flutter/material.dart';
import 'package:rough1/model/task.dart';
import 'package:rough1/provider/task_provider.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    TextEditingController taskController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.insert_emoticon),
        backgroundColor: Colors.blueAccent,
        title: Text("Add Task"),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
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
                  onPressed: () async{
                    final task = taskController.text.trim() ; 
                    if (task.isNotEmpty) {
                      await taskProvider.addTask(Task(task: task)) ; 
                      if(context.mounted){
                        Navigator.pop(context); 
                      }
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
