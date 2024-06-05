import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:frontend/src/components/image_data.dart';
class Post {
  final String title;
  final String content;
  final int point;

  Post({
    required this.title,
    required this.content,
    required this.point,
  });
}



class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({Key? key, required this.post}) : super(key: key);

  Widget _image() {
    return Container(
        padding: const EdgeInsets.only(left: 10),
        child: ImageData(IconsPath.qnaImg, width: 300));
  }

  Widget _title() {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Text(
        '${post.title}',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
  Widget _point() {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Text(
        '${post.point}P',
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4BC27B),
        ),
      ),
    );
  }
  Widget _content() {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
      child: Text(
        '${post.content}',
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        // color: Colors.red,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black),
          )

        ),
        height: 150,
        child: Row(
          children: [
            _image(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _title(),
                      _point(),
                    ],
                  ),
                  _content(),
                ],
              ),
            ),
          ],
        ));
  }
}
