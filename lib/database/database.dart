import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];
  final _toDoBox = Hive.box("toDoApp");

  void createInitData() {
    toDoList = [
      {
        "name": "Do Excerise",
        "isCompleted": false,
      },
    ];
  }

  void loadData() {
    toDoList = _toDoBox.get("TODOLIST");
  }

  void updateData() {
    _toDoBox.put("TODOLIST", toDoList);
  }
}
