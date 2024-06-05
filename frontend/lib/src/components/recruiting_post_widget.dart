import 'package:flutter/material.dart';
import 'package:frontend/src/models/recruiting_post.dart';

class RecruitingPostWidget extends StatelessWidget {
  final RecruitingPost post;
  const RecruitingPostWidget({Key? key, required this.post}) : super(key: key);
  Widget _image() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: CircleAvatar(
        radius: 36,
        backgroundImage: AssetImage(post.imageUrl),
      ),
    );
  }

  Widget _userName() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        '${post.userName}',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      post.title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _content() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '${post.content}',
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _available() {
    return Align(
      // padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Available: ',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${post.available}/5',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4BC27B),
              ),
            ),
          ],
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
          bottom: BorderSide(
            width: 3,
            color: Color(0xFF4BC27B),
          ),
        )),
        constraints: BoxConstraints(
          minHeight: 160, // Set the minimum height
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _image(),
                    _userName(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _title(),
                        _content(),
                      ],
                    ),
                    _available(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
