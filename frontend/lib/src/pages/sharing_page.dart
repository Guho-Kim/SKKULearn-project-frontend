import 'package:flutter/material.dart';
import '../components/post_widget.dart';

class SharingPage extends StatefulWidget {
  const SharingPage({Key? key}) : super(key: key);

  @override
  State<SharingPage> createState() => _SharingPageState();
}

class _SharingPageState extends State<SharingPage> {
    List<Post> posts = [
    Post(title: '자료 공유합니다111', content: '어떻게 해야하나요 이거??', point: 50),
    Post(title: '자료 공유합니다222', content: '어떻게 해야하나요 이거??!!!', point: 10),
    Post(title: '자료 공유합니다333', content: '어떻게 해야하나요 이거??!!!!', point: 3),
    Post(title: '자료 공유합니다444', content: '어떻게 해야하나요 이거??!', point: 30),
    Post(title: '자료 공유합니다555', content: '어떻게 해야하나요 이거??!!', point: 20),
  ];

  Widget _appbar() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 60, bottom: 8),
      color: const Color(0xFF4BC27B),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(top: 8),
                    // margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFA5E1BD),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFF25613D), // 테두리 색상 변경
                        width: 4, // 테두리 너비
                      ),
                    ),
                    child: Text(''),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
                GestureDetector(
                  onTap: () {
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
                                child: Text('Sharing Configuration',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(height: 2,),
                            Container(
                              width: 350,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFF615D5D),
                                // borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text('Upload New Document',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(height: 2,),
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
                                child: Text('My Documents',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(height: 15,),
                            GestureDetector(
                              onTap:(){
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
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 90,
              height: 30,
              // padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black, // 테두리 색상 변경
                  width: 1, // 테두리 너비
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Filter',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.filter_alt,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }

  Widget _postList() {
    return Column(
      // children: List.generate(50, (index) => PostWidget()).toList(),
      children: posts.map((post) => PostWidget(post: post)).toList(),
    );
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
    ));
  }
}
