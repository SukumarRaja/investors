import 'package:flutter/material.dart';

import '../../themes/colors.dart';



commonPopupMenu(BuildContext context) {
  showMenu(
    color: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
    context: context,
    position: const RelativeRect.fromLTRB(25.0, 120.0, 10.0, 0.0),
    items: [
      PopupMenuItem(
        child: buildText(text: "Available"),
        onTap: () {
          // DriverController.to.rideStatus = "progress";
          //
          // DriverController.to.getRideHistory();
        },
      ),
      PopupMenuItem(
        child: buildText(text: "2+ years"),
        onTap: () {
          // DriverController.to.rideStatus = "close";
          //
          // DriverController.to.getRideHistory();
        },
      ),
      PopupMenuItem(
        child: buildText(text: "All"),
        onTap: () {
          // DriverController.to.rideStatus = "close";
          //
          // DriverController.to.getRideHistory();
        },
      ),
    ],
    elevation: 2.0,
  );
}

notificationPopupMenu(BuildContext context) {
  showMenu(
    color: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
    context: context,
    position: const RelativeRect.fromLTRB(25.0, 90.0, 10.0, 0.0),
    items: [
      PopupMenuItem(
        child: buildText(text: "Read"),
        onTap: () {
          // DriverController.to.rideStatus = "progress";
          //
          // DriverController.to.getRideHistory();
        },
      ),
      PopupMenuItem(
        child: buildText(text: "Unread"),
        onTap: () {
          // DriverController.to.rideStatus = "close";
          //
          // DriverController.to.getRideHistory();
        },
      ),
      PopupMenuItem(
        child: buildText(text: "All"),
        onTap: () {
          // DriverController.to.rideStatus = "close";
          //
          // DriverController.to.getRideHistory();
        },
      ),
    ],
    elevation: 2.0,
  );
}
appointmentPopupMenu(BuildContext context) {
  showMenu(
    color: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
    context: context,
    position: const RelativeRect.fromLTRB(25.0, 90.0, 10.0, 0.0),
    items: [
      PopupMenuItem(
        child: buildText(text: "Morning"),
        onTap: () {
          // DriverController.to.rideStatus = "progress";
          //
          // DriverController.to.getRideHistory();
        },
      ),
      PopupMenuItem(
        child: buildText(text: "Afternoon"),
        onTap: () {
          // DriverController.to.rideStatus = "close";
          //
          // DriverController.to.getRideHistory();
        },
      ),
      PopupMenuItem(
        child: buildText(text: "All"),
        onTap: () {
          // DriverController.to.rideStatus = "close";
          //
          // DriverController.to.getRideHistory();
        },
      ),
    ],
    elevation: 2.0,
  );
}

Center buildText({required String text}) {
  return Center(
    child: Container(
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          // color: DriverController.to.rideStatus == text
          //     ? Colors.red
          //     : Colors.white.withAlpha(120)
          color: AppColors.black.withOpacity(.2)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    ),
  );
}

commonHistoryPopupMenu(BuildContext context) {
  showMenu(
    color: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    context: context,
    position: const RelativeRect.fromLTRB(25.0, 105.0, 10.0, 0.0),
    items: [
      PopupMenuItem(
        child: buildText(text: "7 days"),
        onTap: () {
          // DriverController.to.rideStatus = "close";
          // DriverController.to.isInitialHistory = false;
          //
          // DriverController.to.getRideHistory();
        },
      ),
      PopupMenuItem(
        child: buildText(text: "1 month"),
        onTap: () {
          // DriverController.to.rideStatus = "reject";
          // DriverController.to.isInitialHistory = false;
          //
          // DriverController.to.getRideHistory();
        },
      ),
      PopupMenuItem(
        child: buildText(text: "All"),
        onTap: () {
          // DriverController.to.rideStatus = "reject";
          // DriverController.to.isInitialHistory = false;
          //
          // DriverController.to.getRideHistory();
        },
      ),
    ],
    elevation: 2.0,
  );
}
