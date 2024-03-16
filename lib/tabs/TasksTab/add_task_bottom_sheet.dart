import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/tabs/TasksTab/text_form_field.dart';
import 'package:todo_app/model/tasks_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime chossenDate = DateTime.now();
  var titelController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add new Task",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextFormFieldItem(
              controller: titelController, text: "enter your task"),
          TextFormFieldItem(
            controller: descriptionController,
            text: "enter your description",
            maxLines: 5,
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select time",
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF383838))),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              SelectDate(context);
            },
            child: Text(
              chossenDate.toString().substring(0, 10),
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      // ignore: use_full_hex_values_for_flutter_colors
                      color: Color(0xffa9a9a99c))),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5D9CEC)),
                onPressed: addTask,
                // TasksModel model = TasksModel(
                //     description: descriptionController.text,
                //     date: chossenDate.microsecondsSinceEpoch,
                //     title: titelController.text);
                // FirebaseFunctions.addTask(model)
                //     .then((value) => Navigator.pop(context));
                // setState(() {});
                child: Text(
                  "Add Task",
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                )),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SelectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 360)),
        initialDate: chossenDate);
    if (selectedDate != null) {
      chossenDate = selectedDate;
      setState(() {});
    }
  }

  addTask() {
    FirebaseFunctions.addTask(TasksModel(
            description: descriptionController.text,
            date: DateUtils.dateOnly(chossenDate),
            title: titelController.text))
        .then((value) => Navigator.pop(context))
        .catchError((_) {
      print("SomeThing Wrong");
    });
    Navigator.of(context).pop();
    setState(() {});
  }
}
