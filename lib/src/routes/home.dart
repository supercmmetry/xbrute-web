import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xbrute_web/src/controllers/node_controller.dart';
import 'package:xbrute_web/src/controllers/task_controller.dart';
import 'package:xbrute_web/src/widget/task_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NodeController nodeController = Get.find();
    nodeController.masterUrl = "localhost:4444";
    nodeController.slaveUrl = "localhost:4444";

    TaskController taskController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'XBrute',
          style: GoogleFonts.comfortaa(
            textStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.none && snapshot.hasData == null) {
            return Container();
          }

          return TaskListView();
        },
        future: taskController.refresh(),
      ),
    );
  }

}