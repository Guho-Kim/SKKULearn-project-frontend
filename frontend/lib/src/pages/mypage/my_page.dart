import 'package:flutter/material.dart';
import 'package:frontend/src/components/favorite_star_button.dart';
import 'package:frontend/src/controller/user_controller.dart';
import 'package:get/get.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with TickerProviderStateMixin {
  late TabController tabController;
  int selectedTabIndex = 0;
  bool isOngoingVisible = true;
  bool isFinishedVisible = true;

  // late Future<List<dynamic>>? myTeams;

  final UserController userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    // myTeams = loadMyTeams();
  }

  // Future<List<dynamic>> loadMyTeams() async {
  //   final String response =
  //       await rootBundle.loadString('assets/test_json/team_posts.json');
  //   List<dynamic> data = json.decode(response);
  //   return data
  //       .where((item) => item['userName'] == userController.username.value)
  //       .toList();
  // }

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
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 15, 0),
                child: Obx(
                  () => CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage(userController.userImageUrl.value),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 50),
                      child: Obx(() => Text(
                            userController.username.value, // 사용자 이름 표시
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => _statisticsOne(
                              'Shares', userController.shares.value)),
                          Obx(() => _statisticsOne(
                              'Reply', userController.reply.value)),
                          Obx(() => _statisticsOne(
                              'Likes', userController.likes.value)),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _tabMenu() {
    return TabBar(
        controller: tabController,
        indicatorColor: Colors.white,
        indicatorWeight: 10,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 7.0, color: Colors.white),
          insets: EdgeInsets.symmetric(horizontal: -20.0),
        ),
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
        tabs: [
          Container(
            // color: Colors.red,
            padding: const EdgeInsets.only(top: 45, bottom: 5),
            child: Text(
              "My Teams",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 45, bottom: 5),
            child: Text(
              "Point Shop",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]);
  }

  // Widget _myTeamsContent() {
  //   return FutureBuilder<List<dynamic>>(
  //     future: myTeams,
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         if (snapshot.hasError) {
  //           return Text('Error: ${snapshot.error}');
  //         } else if (snapshot.hasData) {
  //           return ListView.builder(
  //             itemCount: snapshot.data!.length,
  //             itemBuilder: (context, index) {
  //               var team = snapshot.data![index];
  //               return ListTile(
  //                 title: Text(team['title']),
  //                 subtitle: Text(team['content']),
  //               );
  //             },
  //           );
  //         }
  //       }
  //       return Center(child: CircularProgressIndicator());
  //     },
  //   );
  // }

  Widget _myTeamsContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                width: 4,
                color: Color(0xFF4BC27B),
              ),
            )),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                      isOngoingVisible ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      isOngoingVisible = !isOngoingVisible; // Toggle visibility
                    });
                  },
                ),
                Expanded(
                  child: Text('Ongoing Teams',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF4BC27B),
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          Visibility(
              visible: isOngoingVisible,
              child: Column(
                children: [
                  _teamContent(
                      'Calculus 1 Study',
                      '2024.04. ~ 2024.06.',
                      'assets/images/my_page_img1.png',
                      'A: Where are we meeting in ...'),
                  _teamContent(
                      'Book Club 2024',
                      '2024.03. ~ 2024.12.',
                      'assets/images/my_page_img2.png',
                      'A: I like Shakespeare! He is ...'),
                ],
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                width: 4,
                color: Color(0xFF4BC27B),
              ),
            )),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(isFinishedVisible
                      ? Icons.expand_less
                      : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      isFinishedVisible =
                          !isFinishedVisible; // Toggle visibility
                    });
                  },
                ),
                Expanded(
                  child: Text('Finished Teams',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF4BC27B),
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          Visibility(
              visible: isFinishedVisible,
              child: Column(
                children: [
                  _teamContent('English Club Spring', '2024.01. ~ 2024.03.',
                      'assets/images/my_page_img3.png', 'A: I like English!'),
                ],
              )),
        ],
      ),
    );
  }

  Widget _teamContent(
      String title, String duration, String imagePath, String answer) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      constraints: BoxConstraints(
        minHeight: 110, // Set the minimum height
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: Image(
                    image: AssetImage(imagePath),
                    width: 90,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      FavoriteStarButton(),
                    ],
                  ),
                  Text(duration,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 10),
                  Text(answer,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pointShopContent() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "My Point: ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Obx(
                () => Text(
                  userController.point.value.toString() + "P",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Text("Decoration",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
          // SizedBox(height: 20),
          Text("Decorate Your Profile!",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              )),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/images/blue_deco.png'), // 아바타 이미지 경로를 설정하세요
                    ),
                    Text('Hat',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('100 Point',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/images/green_deco.png'), // 아바타 이미지 경로를 설정하세요
                    ),
                    Text('star',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('100 Point',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/images/brown_deco.png'), // 아바타 이미지 경로를 설정하세요
                    ),
                    Text('Sun',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('100 Point',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/images/purple_deco.png'), // 아바타 이미지 경로를 설정하세요
                    ),
                    Text('Hat',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('100 Point',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xFF4BC27B),
      // child: SingleChildScrollView(
      child: Column(
        children: [
          _information(),
          _tabMenu(),
          Expanded(
            child: Container(
              color: Colors.white,
              child: TabBarView(
                controller: tabController,
                children: [
                  _myTeamsContent(),
                  _pointShopContent(),
                ],
              ),
            ),
          ),
        ],
      ),
      // ),
    ));
  }
}
