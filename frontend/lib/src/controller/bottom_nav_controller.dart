import 'package:flutter/material.dart';
import 'package:frontend/src/components/message_popup.dart';
import 'package:frontend/src/pages/login/login_page.dart';
import 'package:get/get.dart';

enum PageName { Home, Recruiting, QnA, Sharing }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
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
    if (bottomHistory.contains(value)) {
      bottomHistory.remove(value); // 이미 존재하는 경우 제거
    }
    bottomHistory.add(value); // 방금 선택한 페이지를 제일 뒤로 추가
    print(bottomHistory);
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
