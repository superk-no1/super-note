import 'package:get/get.dart';

import '../screens/home/home_view.dart';

class Pages {
  static const String home = '/home';

  static final list = [
    GetPage(name: home, page: () => const HomeView()),
  ];
}
