import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class ImageData extends StatelessWidget {
  final String icon;
  final double width; // 이미 non-nullable로 선언됨

  ImageData(
    this.icon, {
    Key? key,
    this.width = 55, // 기본값 55로 설정
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context)를 사용하여 현재 context의 devicePixelRatio 가져오기
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Image.asset(
      icon,
      width: width / devicePixelRatio, // 계산에 사용
    );
  }
}

class IconsPath {
  static String get homeOff => 'assets/bottom_nav/home_off_icon.png';
  static String get homeOn => 'assets/images/bottom_nav_home_on_icon.jpg';
  static String get searchOff => 'assets/images/bottom_nav_search_off_icon.jpg';
  static String get searchOn => 'assets/images/bottom_nav_search_on_icon.jpg';
  static String get uploadIcon => 'assets/images/bottom_nav_upload_icon.jpg';
  static String get activeOff => 'assets/images/bottom_nav_active_off_icon.jpg';
  static String get activeOn => 'assets/images/bottom_nav_active_on_icon.jpg';
  static String get qnaImg => 'assets/test_img/qna_test_img.jpg';
  static String get userPhoto => 'assets/images/profile.png';
}
