import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tasks_provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String value = '';
    TasksProvider tasksProvider = Provider.of<TasksProvider>(context);

    return Container(
      padding: const EdgeInsets.all(40.0),
      // padding: const EdgeInsets.symmetric(horizontal: 40.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add a New Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newValue) {
              value = newValue;
            },
          ),
          TextButton(
            onPressed: () {
              tasksProvider.addNewTask(value);
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
            ),
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
