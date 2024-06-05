import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:frontend/src/controller/user_controller.dart';

class CreateTeamPage extends StatefulWidget {
  const CreateTeamPage({Key? key}) : super(key: key);

  @override
  _CreateTeamPageState createState() => _CreateTeamPageState();
}

class _CreateTeamPageState extends State<CreateTeamPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  String? _type = 'Tutoring';
  final UserController userController = Get.find<UserController>();
  final List<ScheduleItem> _schedules = [];

  void _createPost() {
    final newPost = {
      'title': _titleController.text,
      'content': _contentController.text,
      'available': 5,
      'type': _type ?? 'Tutoring',
      'userName': userController.username.value, // RxString을 일반 문자열로 변환
      'imageUrl': userController.userImageUrl.value,
    };

    _saveNewPost(newPost);
  }

  Future<void> _saveNewPost(Map<String, dynamic> newPost) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/team_posts.json';

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

  void _addSchedule() {
    setState(() {
      _schedules.add(ScheduleItem(
        day: 'Monday',
        fromTime: TimeOfDay(hour: 9, minute: 0),
        toTime: TimeOfDay(hour: 9, minute: 0),
      ));
    });
  }

  Widget _buildScheduleItem(ScheduleItem schedule) {
    return Row(
      children: [
        Expanded(
          child: DropdownButton<String>(
            value: schedule.day,
            onChanged: (String? newValue) {
              setState(() {
                schedule.day = newValue!;
              });
            },
            items: [
              'Monday',
              'Tuesday',
              'Wednesday',
              'Thursday',
              'Friday',
              'Saturday',
              'Sunday'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: const Text('Select Day'),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: schedule.fromTime ?? TimeOfDay.now(),
            );
            if (picked != null && picked != schedule.fromTime) {
              setState(() {
                schedule.fromTime = picked;
              });
            }
          },
          child: Container(
            width: 90,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text(
              schedule.fromTime != null
                  ? '${schedule.fromTime!.format(context)}'
                  : '',
            ),
          ),
        ),
        Text('~'),
        GestureDetector(
          onTap: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: schedule.toTime ?? TimeOfDay.now(),
            );
            if (picked != null && picked != schedule.toTime) {
              setState(() {
                schedule.toTime = picked;
              });
            }
          },
          child: Container(
            width: 90,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text(
              schedule.toTime != null
                  ? ' ${schedule.toTime!.format(context)}'
                  : '',
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(Icons.remove_circle, color: Colors.red),
          onPressed: () {
            setState(() {
              _schedules.remove(schedule);
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create New Team',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _type = 'Tutoring';
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      _type == 'Tutoring'
                          ? const Color(0xFF4BC27B)
                          : const Color(0xFFE6E6E6),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      _type == 'Tutoring' ? Colors.white : Colors.black,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text('Tutoring'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _type = 'Mentoring';
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      _type == 'Mentoring'
                          ? const Color(0xFF4BC27B)
                          : const Color(0xFFE6E6E6),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      _type == 'Mentoring' ? Colors.white : Colors.black,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text('Mentoring'),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
                'Schedule',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ..._schedules
                .map((schedule) => _buildScheduleItem(schedule))
                .toList(),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text('Add Schedule',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  TextButton(
                    onPressed: _addSchedule,
                    child: const Text(
                      '+',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
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

class ScheduleItem {
  String? day;
  TimeOfDay? fromTime;
  TimeOfDay? toTime;

  ScheduleItem({this.day, this.fromTime, this.toTime});
}
