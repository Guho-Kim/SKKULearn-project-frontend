import 'package:flutter/material.dart';

class RecruitingPost {
  final String title;
  final String content;
  final int available;
  final String type; // 'Tutoring' 또는 'Mentoring'
  final String userName;

  RecruitingPost({
    required this.title,
    required this.content,
    required this.available,
    required this.type,
    required this.userName,
  });
}

class RecruitingPostWidget extends StatelessWidget {
  final RecruitingPost post;
  const RecruitingPostWidget({Key? key, required this.post}) : super(key: key);
  Widget _image() {
    return Container(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),);
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
    return Center(
      // padding: const EdgeInsets.only(left: 10, top: 10),
      child: Text(
        'Title: ${post.title}',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
  Widget _content() {
    return Align(
      // padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
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
        padding: const EdgeInsets.only(top:10, right:10),
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
            bottom: BorderSide(width: 3, color: Color(0xFF4BC27B),),
          )

        ),
        height: 160,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image(),
                  _userName(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right:50),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title(),
                    _content(),
                    _available(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
