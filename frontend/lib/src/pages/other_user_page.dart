import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frontend/src/controller/user_controller.dart';

class OtherUserPage extends StatefulWidget {
  final String username;

  OtherUserPage({required this.username});

  @override
  State<OtherUserPage> createState() => _OtherUserPageState();
}

class _OtherUserPageState extends State<OtherUserPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  int selectedTabIndex = 0;

  final UserController userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Widget _statisticsOne(String title, int value) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            value.toString(),
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _information() {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 15, 20),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 50),
                    child: Text(
                      widget.username, // 사용자 이름 표시
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => _statisticsOne(
                            'Shares', userController.shares.value + 1)),
                        Obx(() => _statisticsOne(
                            'Reply', userController.reply.value + 121)),
                        Obx(() => _statisticsOne(
                            'Likes', userController.likes.value + 116)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xFF4BC27B),
      child: Column(
        children: [
          _information(),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              width: 500,
              // color: Colors.white,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'May 2024',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Replied 10 Questions in "Caculus"',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'April 2024',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Uploaded "summary note of Statistics"',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/images/other_user_img.png'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
