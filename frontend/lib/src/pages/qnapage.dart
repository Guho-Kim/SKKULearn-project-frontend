import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../components/post_widget.dart';
// import 'package:frontend/src/components/image_data.dart';

class QnAPage extends StatelessWidget {
  const QnAPage({Key? key}) : super(key: key);

  Widget _appbar() {
    return Container(
      // height: 130,
      padding: const EdgeInsets.only(left: 20, right: 10, top: 40),
      color: const Color(0xFF4BC27B),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(top: 8),
                    // margin: const EdgeInsets.only(left: 20, right: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFA5E1BD),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFF25613D), // 테두리 색상 변경
                        width: 4, // 테두리 너비
                      ),
                    ),
                    child: Text(''),
                  ),
                ),
                
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  iconSize: 40,
                  onPressed: () {
                    // 메뉴 버튼 동작
                  },
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  color: Colors.black,
                  iconSize: 40,
                  onPressed: () {
                    // 메뉴 버튼 동작
                  },
                ),
              ],
            ),
            TextButton(
              child: Container(
                width: 90,
                height: 30,
                // padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black, // 테두리 색상 변경
                    width: 1, // 테두리 너비
                  ),
                ),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add Filter',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.filter_alt,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
        
              // icon: Icon(Icons.filter_alt),
              // color: Colors.black,
              // iconSize: 40,
              onPressed: () {
                // Add filter 버튼을 눌렀을 때 동작
                // Navigator.push(
                // context,
                // MaterialPageRoute(builder: (context) => FilterPage()), // FilterPage로 이동
                // );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => PostWidget()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _appbar(),
        Expanded(
          child: SingleChildScrollView(
            child: _postList(),
          ),
        )
      ],
    ));
  }
}
