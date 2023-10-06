import 'package:flutter/material.dart';
import 'package:todoey/screen/add_task_screen.dart';
import 'package:todoey/constant/constant.dart';
import 'package:todoey/widget/task_list.dart';
import 'package:provider/provider.dart';
import '../datafolder/task_data.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: kEdgeEnset,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: kWhiteColor,
                      child: Icon(Icons.list, size: 30, color: kMainColor),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                kSizedBox,
                const Text(
                  kAppName,
                  style: kAppNameStyle,
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} ${Provider.of<TaskData>(context).taskCount <= 1 ? 'Task' : 'Tasks'}',
                  style: kTaskCounterStyle,
                ),
                kSizedBox,
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
      floatingActionButton: AddTaskScreen(),
    );
  }
}
