import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable

class TaskList extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  Function(bool?)? onchange;

  TaskList({
    super.key,
    required this.taskName,
    required this.taskStatus,
    required this.onchange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          children: [
            Checkbox(value: taskStatus, onChanged: onchange),
            Text(
              taskName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        trailing: Row(
          children: [
            InkWell(
              onTap: () {
                print("edit");
              },
              child: const Icon(Icons.edit),
            ),
            InkWell(
              onTap: () {
                print("Delete");
              },
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
      // : Row(
      //   children: [
      //     Checkbox(value: taskStatus, onChanged: onchange),
      //     Text(
      //       taskName,
      //       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      //     ),

      //   ],
      // ),
    );
  }
}
