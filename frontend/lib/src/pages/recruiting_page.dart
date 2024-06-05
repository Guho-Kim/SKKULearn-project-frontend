import 'package:flutter/material.dart';
import '../components/recruiting_post_widget.dart';

class RecruitingPage extends StatefulWidget {
  const RecruitingPage({Key? key}) : super(key: key);
  
  @override
  State<RecruitingPage> createState() => _RecruitingPageState();
}

class _RecruitingPageState extends State<RecruitingPage>
    with TickerProviderStateMixin {
  late TabController tabController2;
  int selectedTabIndex = 0;
  List<RecruitingPost> posts = [
    RecruitingPost(title: 'Title 1', content: 'Document: This is Document. in here, user can write their own description.', available: 3, type: 'Tutoring', userName: 'UserName1'),
    RecruitingPost(title: 'Title 2', content: 'Document: This is Document. in here, user can write their own description.', available: 3, type: 'Tutoring', userName: 'UserName2'),
    RecruitingPost(title: 'Title 3', content: 'Document: This is Document. in here, user can write their own description.', available: 3, type: 'Tutoring', userName: 'UserName3'),
    RecruitingPost(title: 'Title 4', content: 'Document: This is Document. in here, user can write their own description.', available: 2, type: 'Mentoring', userName: 'UserName1'),
    RecruitingPost(title: 'Title 5', content: 'Document: This is Document. in here, user can write their own description.', available: 2, type: 'Mentoring', userName: 'UserName2'),
    // 다른 게시물들 추가
  ];

  @override
  void initState() {
    super.initState();
    tabController2 = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appbar(),
          Expanded(
            child: SingleChildScrollView(
              child: _postList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _appbar() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 60, bottom: 8),
      color: const Color(0xFF4BC27B),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 300,
                child: TabBar(
                    labelPadding: EdgeInsets.only(right: 40),
                    
                    controller: tabController2,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(),
                  onTap: (index) {
                    setState(() {
                      selectedTabIndex = index;
                    });
                  },
                    tabs: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        decoration: BoxDecoration(
                          color: selectedTabIndex == 0 ? Colors.white : Color(0xFF4BC27B),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selectedTabIndex == 0 ? Colors.black : Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          "Tutoring",
                          style: TextStyle(
                              color: selectedTabIndex == 0 ? Colors.black : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        decoration: BoxDecoration(
                          color: selectedTabIndex == 1 ? Colors.white : Color(0xFF4BC27B),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selectedTabIndex == 1 ? Colors.black : Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          "Mentoring",
                          style: TextStyle(
                              color: selectedTabIndex == 1 ? Colors.black : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  
                ),
              ),
              GestureDetector(
                onTap: _showModal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 10),
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _postList() {
    List<RecruitingPost> filteredPosts = [];
    if (selectedTabIndex == 0) {
      filteredPosts = posts.where((post) => post.type == 'Tutoring').toList();
    } else if (selectedTabIndex == 1) {
      filteredPosts = posts.where((post) => post.type == 'Mentoring').toList();
    }
    return Column(
      // children: List.generate(50, (index) => RecruitingPostWidget()).toList(),
      children: filteredPosts.map((post) => RecruitingPostWidget(post: post)).toList(),
      
    );
  }

  void _showModal() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) => Container(
        height: 250,
        child: Column(
          children: [
            Container(
              width: 350,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF615D5D),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text('Recruiting Configuration',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: 350,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF615D5D),
                // borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text('Create New Team',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: 350,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF615D5D),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text('List in Progress',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFF615D5D),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Cancel',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
