import 'package:flutter/material.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/model/tasks_model.dart';

class TasksProvider extends ChangeNotifier {
  List<TasksModel> tasks = [];
  DateTime selectedDate = DateTime.now();

  Future<void> getTasks() async {
    tasks = await FirebaseFunctions.getTask(selectedDate);
    notifyListeners();
  }

  void changeSeletedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}
