// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rough1/model/task.dart';
// import 'package:rough1/service/taskdbhelper.dart';

// class TaskProvider extends ChangeNotifier {
//   List<Task> _taskList = [];
//   final Taskdbhelper _dbhelper = Taskdbhelper();

//   List<Task> get getTaskList => _taskList;

//   TaskProvider() {
//     _loadTask();
//   }

//   Future<void> _loadTask() async {
//     _taskList = await _dbhelper.getTasks;
//     notifyListeners();
//   }

//   Future<void> addTask(Task task) async {
//     await _dbhelper.insertTask(task);
//     await _loadTask();
//   }

//   Future<void> deleteTask(int id) async {
//     await _dbhelper.deleteTask(id);
//     await _loadTask();
//   }

//   Future<void> updateTask(Task task) async {
//     await _dbhelper.updateDb(task);
//     await _loadTask(); 
//   }
// }


import 'package:flutter/material.dart';
import '../model/task.dart';
import '../service/taskdbhelper.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _taskList = [];
  final Taskdbhelper _dbhelper = Taskdbhelper();
  
  // Add these missing state variables ⬇️
  bool _isLoading = false;
  String? _error;

  List<Task> get getTaskList => _taskList;
  bool get isLoading => _isLoading;
  String? get error => _error;

  TaskProvider() {
    _loadTask();
  }

  Future<void> _loadTask() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _taskList = await _dbhelper.getTasks;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTask(Task task) async {
    try {
      _error = null;
      await _dbhelper.insertTask(task);
      await _loadTask();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      _error = null;
      await _dbhelper.deleteTask(id);
      await _loadTask();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      _error = null;
      await _dbhelper.updateDb(task);
      await _loadTask();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
