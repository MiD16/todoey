import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widgets/task_list_tile.dart';

import '../models/tasks_provider.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksProvider, _) => ListView.builder(
        itemCount: tasksProvider.length,
        itemBuilder: (context, index) => TaskListTile(
          name: tasksProvider.tasks[index].name,
          checkboxValue: tasksProvider.tasks[index].isDone,
          toggleCheckbox: (checkValue) {
            tasksProvider.toggleDoneForTask(index);
          },
          deleteTask: () {
            tasksProvider.deleteTask(tasksProvider.tasks[index]);
          },
        ),
      ),
    );
  }
}
