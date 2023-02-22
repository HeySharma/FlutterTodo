import 'package:crud_app/util/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black45,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white12,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.indigo,
                  )),
                  hintText: "Add a new task",
                  hintStyle: TextStyle(color: Colors.white12)),
              style: TextStyle(
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // save Button
                MyButton(text: "Save", onPressed: onSave),
                MyButton(text: "cancel", onPressed: onCancel)
                // cancel Button
              ],
            ),
          ],
        ),
      ),
    );
  }
}
