import 'package:flutter/material.dart';
// import 'package:frontend/src/components/image_data.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with TickerProviderStateMixin {
  late TabController tabController;
  int selectedTabIndex = 0;

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
                      'UserName',
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
                        _statisticsOne('Shares', 1),
                        _statisticsOne('Reply', 123),
                        _statisticsOne('Likes', 12000),
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

Widget _myTeamsContent() {
    return Center(
        child: Text(
          "My Teams Content",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
    );
  }

  Widget _pointShopContent() {
    return Center(
        child: Text(
          "Point Shop Content",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
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
                  color:Colors.white,
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
