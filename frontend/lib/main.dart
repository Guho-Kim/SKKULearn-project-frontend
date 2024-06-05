import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:frontend/src/app.dart';
import 'package:frontend/src/binding/init_bindings.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // 첫 시작 이미지 보여주기
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitBinding(),
      home: const App(),
      debugShowCheckedModeBanner: false,
    );
  }
}
