import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_provider.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/tasks_list_view.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TasksProvider tasksProvider = Provider.of<TasksProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${tasksProvider.length} Tasks',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 2 * MediaQuery.of(context).size.height / 3,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              // height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const TasksListView(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: const AddTaskScreen(),
                ),
              ),
              backgroundColor: const Color(0xFF757575),
              isScrollControlled: true,
            );
          },
          child: const Icon(
            Icons.add,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
