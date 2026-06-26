class Task {
  int? id;
  String task;
  bool isTaskDone;

  Task({this.id, required this.task, this.isTaskDone = false});

  // Convert Task Object to Map to insert in DB

  Map<String, dynamic> toMap() {
    return ({'id': id, 'task': task, 'isTaskDone': isTaskDone});
  }

  // Converting Map to Object to use
  factory Task.fromMap(Map<String, dynamic> mp) {
    return Task(
      id: mp['id'] , 
      task: mp['task'] , 
      isTaskDone: mp["isTaskDone"] == 1 
    ); 
  }
}
