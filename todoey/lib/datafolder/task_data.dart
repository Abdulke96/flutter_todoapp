import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todoey/datafolder/task_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _task = [];

  static const String tasksKey = 'task';
  TaskData() {
    loadTasks();
  }
  UnmodifiableListView<Task> get task {
    return UnmodifiableListView(_task);
  }

  int get taskCount {
    return _task.length;
  }

  get fontSize => null;

  void addTask(String newTaskTitle) {
    if (newTaskTitle.isNotEmpty) {
      final task = Task(name: newTaskTitle);
      _task.add(task);
      saveTasks();
      notifyListeners();
    }
    return;
  }

  void updateTask(Task task, newTaskTitle) {
    task.toggleDone();
    saveTasks();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _task.remove(task);
    saveTasks();
    notifyListeners();
  }

  Future<void> saveTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasksJson = _task.map((task) => task.toJson()).toList();
      await prefs.setString(tasksKey, jsonEncode(tasksJson));
    } catch (e) {
      print('Error saving tasks: $e');
    }
  }

  Future<void> loadTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasksJson = prefs.getString(tasksKey);
      if (tasksJson != null) {
        final tasksList = jsonDecode(tasksJson) as List;
        _task.clear();
        tasksList.forEach((taskJson) {
          _task.add(Task.fromJson(taskJson));
        });
        notifyListeners();
      }
    } catch (e) {
      print('Error loading tasks: $e');
    }
  }
}
