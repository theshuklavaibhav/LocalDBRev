// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:provider/provider.dart';
// import '../model/task.dart';
// import 'package:path/path.dart';

// class Taskdbhelper {
//   // Making Db Singleton and factory Design Pattern
//   static final Taskdbhelper _instance = Taskdbhelper._internal();
//   factory Taskdbhelper() => _instance;
//   Taskdbhelper._internal();

//   static Database? _database;

//   //   static const String _databaseName = 'tasks.db';
//   //   static const int _databaseVersion = 1;
//   //   static const String tableName = 'tasks';
//   //   static const String columnId = 'id';
//   //   static const String columnTask = 'task';
//   //   static const String columnIsTaskDone = 'isTaskDone';

//   // Get Database
//   Future<Database> get getDatabase async {
//     if (_database != null) {
//       return _database!;
//     }
//     _database = await _initDB();
//     return _database!;
//   }

//   static const String dbName = "RevTask.db";
//   static const int dbVersion = 1;
//   static const String tableName = "RevTask";
//   static const String columnId = "id";
//   static const String columnTask = "task";
//   static const String columnIsTaskDone = "isTaskDone";

//   // Create Database
//   Future<Database> _initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, dbName);
//     return await openDatabase(
//       path,
//       version: dbVersion,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE $tableName(
//             $columnId INTEGER PRIMARY KEY AUTOINCREMENT ,
//             $columnTask TEXT NOT NULL ,
//             $columnIsTaskDone INTEGER NOT NULL
//           )
//           ''');
//       },
//     );
//   }

//   // Insert Task
//   Future<int> insertTask(Task task) async {
//     final db = await getDatabase;
//     return await db.insert(
//       tableName,
//       task.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   // Get Tasks
//   Future<List<Task>> getTask() async {
//     final db = await getDatabase;
//     final List<Map<String, dynamic>> tasksMap = await db.query(tableName);
//     return  List.generate(
//       tasksMap.length ,
//       (i) => Task.fromMap(tasksMap[i])
//       ) ;
//   }

//   // Delete Task
//   Future<int> deleteTask(int id) async{
//     final db = await getDatabase ;
//     return await db.delete(
//       tableName ,
//       where: '$columnId = ?' ,
//       whereArgs: [id] ,
//     ) ;
//   }

//   // Update DB
//   Future<int> updateTask(Task task) async{
//     final db = await getDatabase ;
//     return await db.update(
//        tableName,
//        task.toMap() ,
//        where: '$columnId = ?',
//        whereArgs: [task.id]
//       ) ;
//   }

// }

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rough1/model/task.dart';
import 'package:sqflite/sqflite.dart';

class Taskdbhelper {
  // 1. singleton
  // Making private Constructor
  // Defining Private internal constructor
  Taskdbhelper._internal();
  // Define static final instance of TaskdbHelper
  static final Taskdbhelper _instance = Taskdbhelper._internal();
  // Calling Main public constructor as factory constructor
  // Singleton
  factory Taskdbhelper() => _instance;

  // 2. database variable
  static Database? _database;

  // 3. table/column names
  static final String dbName = "RevTaskDb";
  static final int dbVersion = 1;
  static final String tableName = "RevTaskTable";
  static final String columnTaskId = "id";
  static final String columnTask = "task";
  static final String columnIsTaskDone = "isTaskDone";
  // 4. database getter
  Future<Database> get getDatabase async {
    if (_database != null) return _database!;

    _database = await _initDb();
    return _database!;
  }

  // 5. init database
  Future<Database> _initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $tableName(
          $columnTaskId INTEGER PRIMARY KEY AUTOINCREMENT , 
          $columnTask TEXT NOT NUll , 
          $columnIsTaskDone INTEGER NOT NULL
          )
          ''');
      },
    );
  }
  // 6. create table

  // 7. insert
  Future<int> insertTask(Task task) async {
    final db = await getDatabase;
    return await db.insert(
      tableName,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 8. read
  Future<List<Task>> get getTasks async {
    final db = await getDatabase;
    List<Map<String, dynamic>> map = await db.query(tableName);
    return List.generate(map.length, (id) {
      return Task.fromMap(map[id]);
    });
  }

  // 9. update
  Future<int> updateDb(Task task) async {
    final db = await getDatabase;
    return await db.update(
      tableName,
      task.toMap() , 
      where: "$columnTaskId = ?" ,
      whereArgs: [task.id] 
      ); 
  }

  // 10. delete
  Future<int> deleteTask(int id) async{
    final db = await getDatabase ; 
    return db.delete(
      tableName , 
      where: "$columnTaskId = ?" , 
      whereArgs: [id]
    ) ; 
  }
}

