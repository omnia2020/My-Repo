import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/firebase/firebase_functions.dart';
import 'package:todo_app/model/tasks_model.dart';

// ignore: must_be_immutable
class TaskItem extends StatelessWidget {
  TasksModel taskModel;
  TaskItem({required this.taskModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Slidable(
        startActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.edit,
            label: "Edit",
            backgroundColor: const Color(0xFF383838),
            // borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          SlidableAction(
            onPressed: (context) {
              FirebaseFunctions.deleteTask(taskModel.id);
            },
            backgroundColor: const Color(0xFFEC4B4B),
            icon: Icons.delete,
            label: "Delete",
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            children: [
              Container(
                color: const Color(0xff5D9CEC),
                width: 4,
                height: 50,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title!,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff5D9CEC),
                      ),
                    ),
                  ),
                  Text(
                    taskModel.description!,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time),
                      Text(
                        taskModel.date.toString(),
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  decoration: BoxDecoration(
                      color: const Color(0xFF5D9CEC),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 30,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
