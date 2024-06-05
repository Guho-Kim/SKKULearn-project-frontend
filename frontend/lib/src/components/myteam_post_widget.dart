import 'package:flutter/material.dart';

class MyTeamPostWidget extends StatelessWidget {
  const MyTeamPostWidget({Key? key}) : super(key: key);
  Widget _image() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: CircleAvatar(
        radius: 36,
        backgroundImage: AssetImage('assets/images/profile.png'),
      ),
    );
  }

  Widget _title() {
    return Text(
      '팀명',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
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
        // constraints: BoxConstraints(
        // minHeight: 160, // Set the minimum height
        // ),
        height: 10,
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
