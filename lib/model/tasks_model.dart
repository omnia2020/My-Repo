import 'package:cloud_firestore/cloud_firestore.dart';

class TasksModel {
  String id;
  String? title;
  String? description;
  bool? isDone;
  DateTime date;

  TasksModel(
      {required this.description,
      this.id = '',
      this.isDone = false,
      required this.date,
      required this.title});

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "title": title,
      "isDone": isDone,
      "date": Timestamp.fromDate(date),
      "id": id
    };
  }

  TasksModel.fromJson(Map<String, dynamic> json)
      : this(
            date: (json['date'] as Timestamp).toDate(),
            description: json['description'],
            title: json['title'],
            id: json['id'],
            isDone: json['isDone']);
}
