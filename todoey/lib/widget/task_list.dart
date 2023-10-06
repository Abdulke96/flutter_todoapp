import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/datafolder/task_data.dart';
import 'package:todoey/widget/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.task[index];
          return TaskTile(
            taskTile: task.name,
            isChecked: task.isDone,
            checkboxCallback: (checkboxState) {
              taskData.updateTask(task, checkboxState);
            },
            onLongPressCallback: () {
              taskData.deleteTask(task);
            },
            index: index,
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
