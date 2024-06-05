import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/src/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

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
      "id": 6,
      'title': _titleController.text,
      'content': _contentController.text,
      'point': 50,
      'imageUrl': 'assets/images/document_img.png',
      'likes': 0
    };

    _saveNewPost(newPost);
  }

  Future<void> _saveNewPost(Map<String, dynamic> newPost) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/sharing_posts.json';

    File file = File(path);

    // 파일이 존재하지 않으면 새로 생성
    if (!await file.exists()) {
      await file.create(recursive: true);
      await file.writeAsString(json.encode([])); // 빈 배열을 기본값으로 작성
    }

    String fileContent = await file.readAsString();
    List<dynamic> data = json.decode(fileContent);

    data.add(newPost);

    await file.writeAsString(json.encode(data));

    Get.back(result: newPost);
  }

  void _showUploadDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('Upload Document')),
          content: Container(
              height: 30,
              child: Center(
                  child: const Text(
                'Do you want to upload this document?',
                style: TextStyle(
                  fontSize: 16,
                ),
              ))),
          actions: <Widget>[
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(0xFF4BC27B),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _showLoadingDialog();
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context).pop(); // Close the loading dialog
                        // _createPost();
                        Get.back();
                        _showWarningDialog();
                      });
                    },
                    child: const Text(
                      'Upload',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(0xFF4BC27B),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void _showWarningDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('Warning')),
          content: Container(
              height: 30,
              child: Center(
                  child: const Text(
                'Error Message',
                style: TextStyle(
                  fontSize: 16,
                ),
              ))),
          actions: <Widget>[
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Return',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(0xFF4BC27B),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // _showLoadingDialog();
                      // Future.delayed(Duration(seconds: 2), () {
                      //   Navigator.of(context).pop(); // Close the loading dialog
                      //   // _createPost();
                      //   _showWarningDialog();
                      // });
                      Get.back();
                      Get.back();
                    },
                    child: const Text(
                      'Exit',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(0xFF4BC27B),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
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
                    onPressed: () {
                      _showUploadDialog();
                    },
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
