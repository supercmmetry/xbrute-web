import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xbrute_web/src/controllers/node_controller.dart';
import 'package:xbrute_web/src/controllers/task_controller.dart';
import 'package:xbrute_web/src/widget/task_list.dart';

class HomePage extends StatelessWidget {
  Widget buildAddDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add a task',
              style: GoogleFonts.comfortaa(
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                fontSize: 20.0,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Prefix',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    NodeController nodeController = Get.find();
    nodeController.masterUrl = "localhost:4444";
    nodeController.slaveUrl = "localhost:4444";

    TaskController taskController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'XBrute',
              style: GoogleFonts.comfortaa(
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.add),
              tooltip: "Add a task",
              splashRadius: 30.0,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: buildAddDialog,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: "Settings",
              splashRadius: 30.0,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == null) {
            return Container();
          }

          return TaskListView();
        },
        future: taskController.refresh(),
      ),
    );
  }
}
