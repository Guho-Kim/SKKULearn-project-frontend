import 'package:flutter/material.dart';
import 'package:frontend/src/controller/user_controller.dart';
import 'package:get/get.dart';
import '../../models/sharing_post.dart';

class SharingDetailPage extends StatefulWidget {
  final Post post;

  SharingDetailPage({required this.post});

  @override
  _SharingDetailPageState createState() => _SharingDetailPageState();
}

class _SharingDetailPageState extends State<SharingDetailPage> {
  final UserController userController = Get.put(UserController());
  int likes = 0;

  @override
  void initState() {
    super.initState();
    likes = widget.post.likes; // 초기 좋아요 수 설정
  }

  void _incrementLikes() {
    setState(() {
      likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.post.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.post.title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.thumb_up),
                                onPressed: _incrementLikes,
                              ),
                              Text(
                                '$likes ',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        widget.post.content,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Preview',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Image.asset(
                          widget.post.imageUrl,
                          width: 350,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // 다운로드 기능을 구현하세요
              },
              child: Text(
                'Download: ${widget.post.point.toString()}P',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF4BC27B),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
                ),
                minimumSize: const Size(300, 50), // 최소 크기 설정
              ),
            ),
          ],
        ),
      ),
    );
  }
}
