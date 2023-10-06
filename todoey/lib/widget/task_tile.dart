import 'package:flutter/material.dart';
import 'package:todoey/constant/constant.dart';

class TaskTile extends StatelessWidget {
  final String taskTile;
  final bool isChecked;
  final Function checkboxCallback;
  final Function onLongPressCallback;

  final int index;
  const TaskTile({
    required this.taskTile,
    required this.isChecked,
    required this.checkboxCallback,
    required this.onLongPressCallback,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${index + 1}. $taskTile',
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          color: !isChecked ? kInactiveMainColor : Colors.grey,
          fontSize: !isChecked ? 16 : 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      onLongPress: () {
        onLongPressCallback();
      },
      onTap: () {
        checkboxCallback(!isChecked);
      },
      trailing: Checkbox(
        activeColor: kInactiveMainColor,
        value: isChecked,
        onChanged: (newValue) {
          checkboxCallback(newValue);
        },
      ),
    );
  }
}
