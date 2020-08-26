import 'package:get/get.dart';

class NodeController extends GetxController {
  static NodeController get to => Get.find();

  RxString _masterUrl = "".obs;
  RxString _slaveUrl = "".obs;

  String get masterUrl => _masterUrl.value;
  set masterUrl(String value) => _masterUrl.value = value;

  String get slaveUrl => _slaveUrl.value;
  set slaveUrl(String value) => _slaveUrl.value = value;

  void clear() {
    _masterUrl.value = "";
    _slaveUrl.value = "";
  }
}