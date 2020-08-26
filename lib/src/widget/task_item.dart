import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xbrute_web/src/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Column(children: [
            Row(
              children: [
                Text("ID: ${task.id.toString()}",
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Text("Payload: ${task.payload.count.toString()}",
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ])),
    );
  }
}