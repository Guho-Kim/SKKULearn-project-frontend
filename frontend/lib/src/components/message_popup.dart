import 'package:flutter/material.dart';

class MessagePopup extends StatelessWidget {
  final String? message;
  final String? title;
  final Function()? onOk;
  final Function()? onCancel;

  MessagePopup({
    Key? key,
    required this.message,
    required this.title,
    required this.onOk,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Center(child: Text(title!)),
      content: Text(message!),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // 버튼들을 가운데 정렬합니다.
          children: [
            ElevatedButton(
              onPressed: onOk,
              child: Text('OK'),
            ),
            SizedBox(width: 8), // 버튼 사이의 간격
            ElevatedButton(
              onPressed: onCancel,
              child: Text('Cancel'),
            ),
          ],
        )
      ],
    );
  }
}
