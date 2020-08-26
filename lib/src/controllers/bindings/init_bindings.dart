import 'package:get/get.dart';
import 'package:xbrute_web/src/controllers/node_controller.dart';
import 'package:xbrute_web/src/controllers/task_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<TaskController>(TaskController(), permanent: true);
    Get.put<NodeController>(NodeController(), permanent: true);
  }
}