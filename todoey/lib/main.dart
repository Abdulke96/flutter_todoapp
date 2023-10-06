import 'package:flutter/material.dart';
import 'package:todoey/screen/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/datafolder/task_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final taskData = TaskData();
  runApp(MyApp(taskData: taskData));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required TaskData taskData});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return TaskData();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskScreen(),
      ),
    );
  }
}
