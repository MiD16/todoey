import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_provider.dart';
import 'screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksProvider>(
      create: (context) => TasksProvider(),
      child: MaterialApp(
        home: const TasksScreen(),
        theme: ThemeData(
          primaryColor: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
