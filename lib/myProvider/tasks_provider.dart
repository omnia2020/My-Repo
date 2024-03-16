import 'package:flutter/material.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/model/tasks_model.dart';

class TasksProvider extends ChangeNotifier {
  List<TasksModel> tasks = [];
  DateTime selectedDate = DateTime.now();

  Future<void> getTasksByDate() async {
    tasks = await FirebaseFunctions.getTask(selectedDate);
    notifyListeners();
  }

  void changeSeletedDate(DateTime date) async {
    selectedDate = date;
    await getTasksByDate();
    notifyListeners();
  }

  Future<void> addTask(TasksModel model) async {
    tasks = await FirebaseFunctions.addTask(model);
    notifyListeners();
    // await getTasksByDate();
  }

  Future<void> deleteTask(String id) async {
    await FirebaseFunctions.deleteTask(id);
    await getTasksByDate();
    notifyListeners();
  }
}
