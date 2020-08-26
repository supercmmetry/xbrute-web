import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xbrute_web/src/controllers/task_controller.dart';
import 'package:xbrute_web/src/models/task.dart';
import 'package:xbrute_web/src/widget/task_item.dart';

class TaskListView extends StatefulWidget {
  @override
  _TaskListViewState createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  List<Task> items = [];
  TaskController taskController = Get.find();

  @override
  Widget build(BuildContext context) {
    items = taskController.tasks;

    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, position) {
          var item = items[position];
          return Padding(
              padding: EdgeInsets.only(
                  left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
              child: TaskItem(task: item));
        });
  }
}
