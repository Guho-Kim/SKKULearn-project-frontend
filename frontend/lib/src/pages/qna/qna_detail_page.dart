import 'package:flutter/material.dart';
import 'package:frontend/src/controller/user_controller.dart';
import 'package:frontend/src/models/qna_post.dart';
import 'package:frontend/src/pages/sharing/other_user_page.dart';
import 'package:get/get.dart';

class QnADetailPage extends StatefulWidget {
  final Post post;

  QnADetailPage({required this.post});

  @override
  _QnADetailPageState createState() => _QnADetailPageState();
}

class _QnADetailPageState extends State<QnADetailPage> {
  final TextEditingController _commentController = TextEditingController();
  List<Comment> comments = [];
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    comments = widget.post.comments;
  }

  void _addComment(String author, String content) {
    setState(() {
      comments.add(Comment(author: author, content: content));
    });
    userController.point.value += 5;
    _commentController.clear();
    FocusScope.of(context).unfocus(); // 키보드 자판 내리기
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Uploading Comments'),
          content: Text('Got 5 Points'),
          actions: [
            TextButton(
              onPressed: () {
                _addComment(
                    '${userController.username.value}/Software Department',
                    _commentController.text);
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('Exit'),
            ),
          ],
        );
      },
    );
  }

  void _goToOtherUserPage(String username) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtherUserPage(username: username.split('/')[0]),
      ),
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // 아무 여백 클릭 시 키보드 내리기
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Image.asset(
                            widget.post.imageUrl,
                            width: 350,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          widget.post.content,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        color: const Color(0xFF4BC27B),
                        height: 20,
                      ),
                      Text(
                        '댓글',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: comments.map((comment) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _goToOtherUserPage(comment.author);
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 12, left: 8),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(
                                          'assets/images/profile.png'), // 이미지 경로를 설정하세요
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10), // 프로필 이미지와 텍스트 사이 간격
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              comment.author,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.thumb_up),
                                            onPressed: () {
                                              // 좋아요 기능을 구현하세요
                                            },
                                          ),
                                        ],
                                      ),
                                      Text(
                                        comment.content,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _commentController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: const Color(0xFF4BC27B),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 80,
                      child: TextButton(
                        onPressed: () {
                          // _addComment(
                          //     '${userController.username.value}/소프트웨어학부',
                          //     _commentController.text);
                          _showConfirmationDialog();
                        },
                        child: const Text(
                          'Send',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF4BC27B),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // 둥근 모서리 설정
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
