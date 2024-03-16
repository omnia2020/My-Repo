import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/tasks_model.dart';

class FirebaseFunctions {
  static CollectionReference<TasksModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TasksModel>(
      fromFirestore: (snapshot, _) {
        return TasksModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static Future<List<TasksModel>> addTask(TasksModel model) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    return collection.doc(model.id).set(model).then((value) {
      return getTask(model.date);
    });
  }

  static Future<List<TasksModel>> getTask(DateTime date) async {
    final taskCollection =
        getTaskCollection().where("date", isEqualTo: DateUtils.dateOnly(date));
    final querySnapshot = await taskCollection.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  static Future<void> deleteTask(String id) async {
    log("deleteTask: $id");
    await getTaskCollection().doc(id).delete();
  }
}
