import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:xbrute_web/src/controllers/bindings/init_bindings.dart';
import 'package:xbrute_web/src/routes/home.dart';

class XBruteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: 'XBrute',
      initialRoute: '/',
      initialBinding: InitBindings(),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          opaque: true,
        ),
      ]
    );
  }
  
}