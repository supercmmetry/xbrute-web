import 'dart:convert';

import 'package:get/get.dart';
import 'package:xbrute_web/src/controllers/node_controller.dart';
import 'package:xbrute_web/src/models/task.dart';
import 'package:http/http.dart' as http;

class TaskController extends GetxController {
  RxList<Task> _tasks = List<Task>().obs;

  List<Task> get tasks => _tasks.value;
  set tasks(List<Task> value) => _tasks.value = value;

  Future<List<Task>> _getTasks() async {
    NodeController nodeController = Get.find();
    var url = nodeController.masterUrl + "/api/v1/tasks/all";
    var newTasks = List<Task>();

    final http.Response response = await http.get(url);

    var json = jsonDecode(response.body);
    for (final taskJson in json["tasks"]) {
      newTasks.add(Task.fromJson(taskJson));
    }

    return newTasks;
  }

  Future<void> refresh() async {
    tasks = await _getTasks();
  }
}