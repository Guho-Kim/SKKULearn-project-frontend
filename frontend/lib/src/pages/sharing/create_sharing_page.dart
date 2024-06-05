import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:frontend/src/controller/user_controller.dart';
import 'package:get/get.dart';

class CreateSharingPage extends StatefulWidget {
  const CreateSharingPage({Key? key}) : super(key: key);

  @override
  _CreateSharingPageState createState() => _CreateSharingPageState();
}

class _CreateSharingPageState extends State<CreateSharingPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final UserController userController = Get.find<UserController>();

  void _createPost() {
    final newPost = {
      'title': _titleController.text,
      'content': _contentController.text,
      'userName': userController.username,
    };

    _saveNewPost(newPost);
  }

  Future<void> _saveNewPost(Map<String, dynamic> newPost) async {
    final String response =
        await rootBundle.loadString('assets/test_json/sharing_posts.json');
    List<dynamic> data = json.decode(response);
    data.add(newPost);

    Get.back(result: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Uploading Document',
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Title:',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                        child: TextField(
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      controller: _titleController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                controller: _contentController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                maxLines: null,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Document',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Image(
                image: AssetImage('assets/images/document_img.png'),
                width: 325,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  width: 325,
                  child: TextButton(
                    onPressed: _createPost,
                    child: const Text(
                      'Submit',
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
