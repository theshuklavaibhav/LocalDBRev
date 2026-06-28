import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'addScreen.dart';
import '../provider/task_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white , 
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: Icon(Icons.task),
        title: Text("HomePage")
        ),
      body: Consumer<TaskProvider>(
        builder: (context, taskprovider, child) {
          if (taskprovider.getTaskList.isEmpty) {
            return const Center(child: Text("No tasks found! Add some."));
          }
          return ListView.builder(
            itemCount: taskprovider.getTaskList.length,
            itemBuilder: (context, index) {
              final task = taskprovider.getTaskList[index];
              return Card(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(10), // Fixed abstract class error
                  child: ListTile(
                    leading: Checkbox(
                      value: task.isTaskDone,
                      onChanged: (value) {
                        task.isTaskDone = value ?? false;
                        taskprovider.updateTask(task); 
                      },
                    ),
                    title: Text(task.task),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        if (task.id != null) {
                          taskprovider.deleteTask(task.id!);
                        }
                      },
                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration: task.isTaskDone ? TextDecoration.lineThrough : TextDecoration.none
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => AddScreen())); 
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
