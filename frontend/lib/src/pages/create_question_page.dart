import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:frontend/src/controller/user_controller.dart';
import 'package:get/get.dart';
import 'qna_page.dart';

class CreateQuestionPage extends StatefulWidget {
  const CreateQuestionPage({Key? key}) : super(key: key);

  @override
  _CreateQuestionPageState createState() => _CreateQuestionPageState();
}

class _CreateQuestionPageState extends State<CreateQuestionPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _pointController = TextEditingController();
  final UserController userController = Get.find<UserController>();

  void _createPost() {
    final newPost = {
      'title': _titleController.text,
      'content': _contentController.text,
      'point': int.parse(_pointController.text),
      'userName': userController.username,
    };

    _saveNewPost(newPost);
  }

  Future<void> _saveNewPost(Map<String, dynamic> newPost) async {
    final String response =
        await rootBundle.loadString('assets/test_json/qna_posts.json');
    List<dynamic> data = json.decode(response);
    data.add(newPost);

    Get.back(result: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create New Question',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Title',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFD9D9D9),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
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
              controller: _contentController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFD9D9D9),
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
                'Point',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              controller: _pointController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFD9D9D9),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.number,
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(300, 50),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
