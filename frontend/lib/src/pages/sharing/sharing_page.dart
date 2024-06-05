import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:frontend/src/components/sharing_post_widget.dart';
import 'package:frontend/src/pages/sharing/create_sharing_page.dart';
import 'package:get/get.dart';
import '../../models/sharing_post.dart';

class SharingPage extends StatefulWidget {
  const SharingPage({Key? key}) : super(key: key);

  @override
  State<SharingPage> createState() => _SharingPageState();
}

class _SharingPageState extends State<SharingPage> {
  List<SharingPost> posts = [];

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final String response =
        await rootBundle.loadString('assets/test_json/sharing_posts.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      posts = data.map((post) => SharingPost.fromJson(post)).toList();
    });
  }

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
                  decoration: BoxDecoration(
                    color: Color(0xFFA5E1BD),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xFF25613D),
                      width: 4,
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
                          SizedBox(
                            height: 2,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Get.to(() => CreateSharingPage())!
                                  .then((newPost) {
                                if (newPost != null) {
                                  setState(() {
                                    posts.add(SharingPost(
                                        id: newPost['id'],
                                        title: newPost['title'],
                                        content: newPost['content'],
                                        point: newPost['point'],
                                        likes: newPost['likes'],
                                        imageUrl: newPost['imageUrl']));
                                  });
                                }
                              });
                            },
                            child: Container(
                              width: 350,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFF615D5D),
                              ),
                              child: Center(
                                child: Text('Upload New Document',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
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
                              child: Text('My Documents',
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
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 1,
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
      children: posts.map((post) => SharingPostWidget(post: post)).toList(),
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
      ),
    );
  }
}
