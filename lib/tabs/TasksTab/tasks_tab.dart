import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/myProvider/tasks_provider.dart';
import 'package:todo_app/tabs/TasksTab/task_item.dart';

// ignore: must_be_immutable
class TasksTab extends StatelessWidget {
  TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TasksProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          DatePicker(
            height: 100,
            DateTime.now(),
            initialSelectedDate: taskProvider.selectedDate,
            selectionColor: Colors.white,
            selectedTextColor: const Color(0xff5D9CEC),
            onDateChange: (date) {
              taskProvider.changeSeletedDate(date);
            },
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemBuilder: (_, index) => TaskItem(
                taskModel: taskProvider.tasks[index],
              ),
              itemCount: taskProvider.tasks.length,
            ),
          )
        ],
      ),
    );
  }
}
