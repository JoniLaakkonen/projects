import 'package:flutter/material.dart';
import 'package:markitup/models/task.dart';

class Taskprovider with ChangeNotifier{
  final List<Task> _tasks = [];
  
  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(Task task){
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  int getLength() {
    return _tasks.length;
  }

  Task getTask(int index) {
    return _tasks[index];
  }

  
  // Additional useful methods
  List<Task> getEntries() {
    return List.unmodifiable(_tasks); // Return an unmodifiable list for safety
  }
}