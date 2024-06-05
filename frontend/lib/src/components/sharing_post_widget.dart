import 'package:flutter/material.dart';
import 'package:frontend/src/pages/sharing/SharingDetailPage.dart';
import 'package:get/get.dart';
import '../models/sharing_post.dart';

class SharingPostWidget extends StatelessWidget {
  final Post post;
  const SharingPostWidget({Key? key, required this.post}) : super(key: key);

  Widget _image() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Image.asset(
        post.imageUrl,
        width: 100,
      ),
    );
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

  Widget _like() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Text(
            '${post.likes} ',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4BC27B),
            ),
          ),
          Image(
            image: AssetImage('assets/images/green_thumb.png'),
            width: 30,
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        '${post.content}',
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        maxLines: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SharingDetailPage(post: post));
      },
      child: Container(
        // margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black),
          ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _like(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
