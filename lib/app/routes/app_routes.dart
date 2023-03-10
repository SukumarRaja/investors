import 'package:get/get.dart';
import '../ui/screens/home/home.dart';
import '../ui/screens/home/main.dart';
import '../ui/screens/initial.dart';
import '../ui/screens/login.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: "/",
      page: () => const Initial(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: "/login",
      page: () => const Login(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: "/homeMain",
      page: () => HomeMain(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: "/home",
      page: () => const Home(),
      transition: Transition.zoom,
    ),

  ];
}
