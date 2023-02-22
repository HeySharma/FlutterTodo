import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onchanged;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onchanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        // ignore: sort_child_properties_last
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Checkbox(
                value: taskCompleted,
                onChanged: onchanged,
                side: BorderSide(color: Colors.white12),
              ),
            ),
            // Task Name
            Text(
              taskName,
              style: TextStyle(
                  color: Colors.white,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromARGB(26, 255, 255, 255),
              width: 0.5,
            )),
      ),
    );
  }
}
