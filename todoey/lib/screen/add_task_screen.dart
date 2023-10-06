import 'package:flutter/material.dart';
import 'package:todoey/constant/constant.dart';
import 'package:provider/provider.dart';
import 'package:todoey/datafolder/task_data.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  String newTaskTitle = '';
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kInactiveMainColor,
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              color: kDoneColor,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        kAddTask,
                        style: kAddTaskStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    kSizedBox,
                    TextField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Enter your task',
                        hintStyle: TextStyle(
                          fontSize: 24,
                          color: kDoneColor,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: kInactiveMainColor, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: kInactiveMainColor, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      onChanged: (value) {
                        newTaskTitle = value;
                      },
                      style: const TextStyle(
                        fontSize: 24,
                        color: kInactiveMainColor,
                        fontWeight: FontWeight.w500,
                      ),
                      cursorColor: kMainColor,
                      keyboardType: TextInputType.text,
                    ),
                    kSizedBox,
                    Container(
                      width: double.infinity,
                      color: kWhiteColor,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: kWhiteColor,
                          backgroundColor: kInactiveMainColor,
                        ),
                        onPressed: () {
                          Provider.of<TaskData>(context, listen: false)
                              .addTask(newTaskTitle);

                          Navigator.pop(context);
                        },
                        child: const Text(
                          kSaveTask,
                          style: kSaveTaskStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add, size: 30, color: kWhiteColor),
    );
  }
}
