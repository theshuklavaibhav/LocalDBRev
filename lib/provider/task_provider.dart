import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rough1/model/task.dart';
import 'package:rough1/service/taskdbhelper.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _taskList = [];
  final Taskdbhelper _dbhelper = Taskdbhelper();

  List<Task> get getTaskList => _taskList;

  TaskProvider() {
    _loadTask();
  }

  Future<void> _loadTask() async {
    _taskList = await _dbhelper.getTasks;
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await _dbhelper.insertTask(task);
    await _loadTask();
  }

  Future<void> deleteTask(int id) async {
    await _dbhelper.deleteTask(id);
    await _loadTask();
  }

  Future<void> updateTask(Task task) async {
    await _dbhelper.updateDb(task);
    await _loadTask(); 
  }
}
