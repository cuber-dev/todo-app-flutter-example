// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/database/database.dart';
import 'package:to_do_app/pages/utils/add_task_dialog.dart';
import 'package:to_do_app/pages/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _toDoBox = Hive.box("toDoApp");
  ToDoDatabase db = ToDoDatabase();

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    if (_toDoBox.get("TODOLIST") == null) {
      db.createInitData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void changeCheckBoxValue(bool? value, int index) {
    setState(() {
      db.toDoList[index]['isCompleted'] = !db.toDoList[index]['isCompleted'];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      String newTask = controller.text;
      if (newTask != "") {
        db.toDoList.add({
          'name': newTask,
          'isCompleted': false,
        });
      }
      controller.clear();
      Navigator.of(context).pop();
    });
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('TO DO'),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddTaskDialog(
                controller: controller,
                onSave: saveNewTask,
                onCancel: () => Navigator.of(context).pop(),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index]['name'],
            isTaskCompleted: db.toDoList[index]['isCompleted'],
            onChanged: (value) => changeCheckBoxValue(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
