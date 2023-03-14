import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/dashboard.dart';
import '../../../controller/main.dart';
import '../../../controller/profile.dart';
import '../../themes/colors.dart';
import '../history.dart';
import '../profile.dart';
import 'home.dart';

class HomeMain extends StatelessWidget {
  HomeMain({Key? key}) : super(key: key);
  final List<Widget> pages = [
    const Profile(),
    const Home(),
    const TransactionHistory()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DashboardController(),
        initState: (_) {
          DashboardController.to.getProfile();
          DashboardController.to.getLedger();
        },
        builder: (_) {
          return Scaffold(
            bottomNavigationBar: Obx(() => BottomNavigationBar(
                  backgroundColor: ProfileController.to.logoutLoading == true
                      ? AppColors.black.withOpacity(.6)
                      : AppColors.secondary,
                  currentIndex: MainController.to.pageIndex,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: AppColors.grey,
                  elevation: 25,
                  selectedItemColor: AppColors.secondPrimary,
                  showUnselectedLabels: false,
                  showSelectedLabels: true,
                  selectedLabelStyle: const TextStyle(fontFamily: "Oswald"),
                  selectedIconTheme:
                      const IconThemeData(color: AppColors.secondPrimary),
                  unselectedIconTheme:
                      const IconThemeData(color: AppColors.grey),
                  onTap: ProfileController.to.logoutLoading == true
                      ? null
                      : (data) {
                          MainController.to.pageIndex = data;
                        },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "Profile"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_filled), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.calendar_month), label: "History"),
                  ],
                )),
            body: Obx(() => pages[MainController.to.pageIndex]),
          );
        });
  }

  Icon buildDecoratedIcon(
      {double size = 30.0, required IconData icon, required Color color}) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
