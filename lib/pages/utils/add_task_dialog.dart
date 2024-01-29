// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do_app/pages/utils/my_button.dart';

class AddTaskDialog extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  AddTaskDialog({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      content: Container(
        height: 200,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Task",
              ),
              autofocus: true,
              maxLength: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  buttonName: "Cancel",
                  onPressed: onCancel,
                ),
                SizedBox(width: 7),
                MyButton(
                  buttonName: "Save",
                  onPressed: onSave,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
