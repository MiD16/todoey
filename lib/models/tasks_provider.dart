import 'package:flutter/material.dart';
import 'task.dart';

class TasksProvider extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Task 1'),
    Task(name: 'Task 2'),
    Task(name: 'Task 3'),
  ];

  void addNewTask(String newTaskName) {
    _tasks.add(Task(name: newTaskName));
    notifyListeners();
  }

  void toggleDoneForTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  get length => _tasks.length;

  get tasks => [..._tasks];
}
