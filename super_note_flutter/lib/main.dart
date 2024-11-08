import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '备忘录',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF2F2F7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF2F2F7),
          elevation: 0,
        ),
      ),
      initialRoute: Pages.home,
      getPages: Pages.list,
      debugShowCheckedModeBanner: false,
    );
  }
}
