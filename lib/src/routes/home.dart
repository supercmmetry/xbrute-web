import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xbrute_web/src/controllers/node_controller.dart';
import 'package:xbrute_web/src/controllers/task_controller.dart';
import 'package:xbrute_web/src/models/task.dart';
import 'package:xbrute_web/src/widget/task_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final prefixController = TextEditingController();
  final startController = TextEditingController();
  final alphabetController = TextEditingController();
  final targetController = TextEditingController();
  final partialDataController = TextEditingController();
  final countController = TextEditingController();
  final masterUrlController = TextEditingController();
  final slaveUrlController = TextEditingController();

  String algorithm = 'AES';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    prefixController.dispose();
    startController.dispose();
    alphabetController.dispose();
    targetController.dispose();
    partialDataController.dispose();
    countController.dispose();
    super.dispose();
  }

  Widget buildAddDialog(BuildContext context) {
    TaskController taskController = Get.find();

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Add a task',
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Prefix',
                  ),
                  controller: prefixController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Start',
                  ),
                  controller: startController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alphabet',
                  ),
                  controller: alphabetController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: countController,
                  decoration: InputDecoration(
                    labelText: "Count",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: DropdownButton<String>(
                    value: algorithm,
                    items: <String>['AES'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        algorithm = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Target',
                  ),
                  controller: targetController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Partial Data',
                  ),
                  controller: partialDataController,
                ),
              ),
            ),
            FlatButton(
              textColor: Colors.blueAccent,
              child: Text("ADD",
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                  )),
              onPressed: () async {
                var task = Task(
                  id: 0,
                  payload: Payload(
                    start: startController.value.text
                        .split(" ")
                        .map((s) => int.parse(s))
                        .toList(),
                    prefix: prefixController.value.text
                        .split(" ")
                        .map((s) => int.parse(s))
                        .toList(),
                    alphabet: alphabetController.value.text
                        .split(" ")
                        .map((s) => int.parse(s))
                        .toList(),
                    count: int.parse(countController.value.text),
                  ),
                  target: targetController.value.text
                      .split(" ")
                      .map((s) => int.parse(s))
                      .toList(),
                  partialData: partialDataController.value.text
                      .split(" ")
                      .map((s) => int.parse(s))
                      .toList(),
                  algorithm: algorithm,
                );

                await taskController.add(task);
                await taskController.refresh();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildSettingsDialog(BuildContext context) {
    NodeController nodeController = Get.find();

    masterUrlController.text = nodeController.masterUrl;
    slaveUrlController.text = nodeController.slaveUrl;

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Settings',
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Master URL',
                  ),
                  controller: masterUrlController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Slave URL',
                  ),
                  controller: slaveUrlController,
                ),
              ),
            ),
            FlatButton(
              textColor: Colors.blueAccent,
              child: Text("SAVE",
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                  )),
              onPressed: () {
                nodeController.masterUrl = masterUrlController.value.text;
                nodeController.slaveUrl = slaveUrlController.value.text;
              },
            )
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
    taskController.refresh();

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
              icon: Icon(Icons.refresh_rounded),
              tooltip: "Refresh",
              splashRadius: 30.0,
              onPressed: () async {
                await taskController.refresh();
              },
            ),
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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: buildSettingsDialog,
                );
              },
            ),
          ],
        ),
      ),
      body: TaskListView()
    );
  }
}
