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
      title: 'Super Notes',
      theme: ThemeData.light(),
      initialRoute: Pages.home,
      getPages: Pages.list,
      debugShowCheckedModeBanner: false,
    );
  }
}
