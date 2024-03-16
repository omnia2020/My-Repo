import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/tabs/TasksTab/add_task_bottom_sheet.dart';
import 'package:todo_app/tabs/TasksTab/tasks_tab.dart';
import 'package:todo_app/tabs/setting_tab/settings_tab.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  static const routName = "home";
  HomeScreen({super.key});
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFDFECDB),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color(0xff5D9CEC),
        title: Text(index == 0 ? "To Do List" : "Settings",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white))),
      ),
      bottomNavigationBar: Stack(children: [
        BottomAppBar(
            notchMargin: 12,
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            child: Container()),
        BottomNavigationBar(
            backgroundColor: Colors.transparent,
            iconSize: 32,
            currentIndex: index,
            elevation: 0.0,
            onTap: (value) {
              index = value;
            },
            selectedItemColor: const Color(0xff5D9CEC),
            unselectedItemColor: Colors.grey.shade400,
            items: const [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Icon(
                      Icons.format_list_bulleted,
                    ),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Icon(
                      Icons.settings_outlined,
                    ),
                  ),
                  label: ""),
            ]),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const AddTaskBottomSheet());
            },
          );
        },
        backgroundColor: const Color(0xff5D9CEC),
        shape:
            CircleBorder(side: const BorderSide(color: Colors.white, width: 3)),
        // RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(30),
        //     side: const BorderSide(color: Colors.white, width: 3)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[index],
    );
  }

  List<Widget> tabs = [TasksTab(), const SettingsTab()];
}
