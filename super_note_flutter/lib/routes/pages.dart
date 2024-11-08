import 'package:get/get.dart';
import '../screens/home/home_binding.dart';
import '../screens/home/home_view.dart';

abstract class Pages {
  static const home = '/home';

  static final list = [
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
