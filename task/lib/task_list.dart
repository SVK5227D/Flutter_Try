import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.only(left: 55, right: 55, top: 25),
      color: Colors.teal[100],
      child: Row(
        children: [
          Checkbox(value: taskStatus, onChanged: onchange),
          Text(
            taskName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
