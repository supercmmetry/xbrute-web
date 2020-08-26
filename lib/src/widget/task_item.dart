import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xbrute_web/src/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        child: Card(
          elevation: 10,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("ID: ${task.id.toString()}",
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Text("Payload: ${task.payload.count.toString()}",
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Algorithm: ${task.algorithm.toString()}",
                              style: GoogleFonts.comfortaa(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                              )),
                          OutlineButton(
                            highlightElevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.black, //Color of the border
                              style: BorderStyle.solid, //Style of the border
                              width: 2.0, //width of the border
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Text("Execute",
                                style: GoogleFonts.comfortaa(
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                )),
                            onPressed: () {
                              Get.snackbar(
                                  "Button clicked!", "The button was clicked",
                                  snackPosition: SnackPosition.BOTTOM);
                            },
                          )
                        ]))
              ])),
        ));
  }
}
