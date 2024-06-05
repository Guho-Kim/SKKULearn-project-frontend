import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:frontend/src/controller/user_controller.dart';
import 'package:get/get.dart';
import 'recruiting_page.dart';

class CreateTeamPage extends StatefulWidget {
  const CreateTeamPage({Key? key}) : super(key: key);

  @override
  _CreateTeamPageState createState() => _CreateTeamPageState();
}

class _CreateTeamPageState extends State<CreateTeamPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _scheduleController = TextEditingController();
  String? _type = 'Tutoring';
  final List<String> _types = ['Tutoring', 'Mentoring'];
  final UserController userController = Get.find<UserController>();
  final List<ScheduleItem> _schedules = [];

  void _createPost() {
    final newPost = {
      'title': _titleController.text,
      'content': _contentController.text,
      'available': 5,
      'type': _type ?? 'Tutoring', // Default to 'Tutoring' if null
      'schedule': _schedules.map((schedule) => schedule.toJson()).toList(),
      'userName': userController.username,
    };

    _saveNewPost(newPost);
  }

  Future<void> _saveNewPost(Map<String, dynamic> newPost) async {
    final String response =
        await rootBundle.loadString('assets/test_json/posts.json');
    List<dynamic> data = json.decode(response);
    data.add(newPost);

    // 이후, 서버에 저장하거나 로컬 스토리지에 저장하는 로직을 구현할 수 있습니다.
    // 예시: Get.back() 호출하여 이전 페이지로 돌아가고 새로운 게시물을 추가합니다.
    Get.back(result: data);
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
              maxLines: null, // 여러 줄 입력이 가능하도록 설정
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
    );
  }
}

class ScheduleItem {
  String? day;
  TimeOfDay? fromTime;
  TimeOfDay? toTime;

  ScheduleItem({this.day, this.fromTime, this.toTime});

  Map<String, dynamic> toJson() => {
        'day': day,
        'fromTime': fromTime != null ? fromTime!.format(Get.context!) : null,
        'toTime': toTime != null ? toTime!.format(Get.context!) : null,
      };
}
