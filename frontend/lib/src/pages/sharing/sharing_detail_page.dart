import 'package:flutter/material.dart';
import 'package:frontend/src/controller/user_controller.dart';
import 'package:frontend/src/models/sharing_post.dart';
import 'package:get/get.dart';

class SharingDetailPage extends StatefulWidget {
  final SharingPost post;

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

  void _downloadPost(int point) {
    userController.point.value -= point;
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('Download')),
          content: Container(
            height: 30,
            child: Center(
              child: Text(
                'Successfully Downloaded!',
                style: TextStyle(
                  fontSize: 16,
                  // color: const Color(0xFF4BC27B),
                ),
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(left: 24, right: 24, bottom: 8),
          actionsPadding: EdgeInsets.all(0),
          actions: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                TextButton(
                  onPressed: () {
                    _downloadPost(widget.post.point);
                    Navigator.of(context).pop(); // 다이얼로그 닫기
                    Get.back(); // 페이지 닫기
                  },
                  child: Text(
                    'Exit',
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color(0xFF4BC27B),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
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
                                onPressed: () {},
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
                _showConfirmationDialog();
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
