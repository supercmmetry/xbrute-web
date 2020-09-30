import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xbrute_web/src/controllers/task_controller.dart';
import 'package:xbrute_web/src/models/task.dart';
import 'package:xbrute_web/src/widget/task_item.dart';

class TaskListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.find();

    return Obx(() {
      return ListView.builder(
          itemCount: taskController.tasks.length,
          itemBuilder: (context, position) {
            var item = taskController.tasks[position];
            return Padding(
                padding: EdgeInsets.only(
                    left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
                child: TaskItem(task: item));
          });
    });
  }
}
