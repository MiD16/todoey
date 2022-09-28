import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  final String name;
  final bool checkboxValue;
  final void Function() deleteTask;
  final void Function(bool?) toggleCheckbox;
  const TaskListTile({
    Key? key,
    required this.name,
    required this.deleteTask,
    required this.checkboxValue,
    required this.toggleCheckbox,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(
          fontSize: 20,
          decoration: checkboxValue ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: checkboxValue,
        onChanged: toggleCheckbox,
      ),
      onLongPress: deleteTask,
    );
  }
}
