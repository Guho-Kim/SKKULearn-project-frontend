import 'package:flutter/material.dart';
import 'package:frontend/src/components/message_popup.dart';
import 'package:frontend/src/pages/chatting.dart';
import 'package:frontend/src/pages/login_page.dart';
import 'package:get/get.dart';

enum PageName { Home, Recruiting, QnA, Sharing, Chatting }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.Chatting:
        Get.to(() => Chatting());
        break;
      case PageName.Home:
      case PageName.Recruiting:
      case PageName.QnA:
      case PageName.Sharing:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
      print(bottomHistory);
    }
  }

  Future<bool> onBackPressed() async {
    if (bottomHistory.length > 1) {
      bottomHistory.removeLast();
      changeBottomNav(bottomHistory.last, hasGesture: false);
      return false;
    } else {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopup(
                message: '종료하시겠습니까?',
                title: '시스템',
                onOk: () {
                  Navigator.of(context).pop(true);
                  Get.offAll(() => const LoginPage());
                },
                onCancel: () {
                  Navigator.of(context).pop(false);
                },
              ));
      return true;
    }
  }
}
