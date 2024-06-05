import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/src/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:frontend/src/app.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //user controller
  final UserController userController = Get.put(UserController());

  late String _correctUsername;
  late String _correctPassword;

  @override
  void initState() {
    super.initState();
    _loadLoginData();
  }

  Future<void> _loadLoginData() async {
    final String response =
        await rootBundle.loadString('assets/test_json/user.json');
    final data = await json.decode(response);
    setState(() {
      _correctUsername = data['username'];
      _correctPassword = data['password'];
    });
  }

  Future<void> _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // 로컬의 test.json 파일을 로드
    final String response =
        await rootBundle.loadString('assets/test_json/user.json');
    final data = json.decode(response);

    // 로그인 성공 시 메인 페이지로 이동
    if (username == _correctUsername && password == _correctPassword) {
      userController.setUser(
        data['username'],
        data['shares'],
        data['reply'],
        data['likes'],
        data['point'],
      );
      Get.off(() => const App());
    } else {
      // 로그인 실패 시 에러 메시지 표시
      Get.snackbar('Error', 'Invalid username or password',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
// Future<void> _login() async {
//     // 로그인 로직을 구현합니다.
//     String username = _usernameController.text;
//     String password = _passwordController.text;

//     // FastAPI 백엔드로 데이터 전송
//     var url = Uri.parse('https://yourapi.com/login'); // 여기에 API 엔드포인트 URL 입력
//     var response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({
//         'username': username,
//         'password': password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       userController.setUser(
//         data['username'],
//         data['shares'],
//         data['reply'],
//         data['likes'],
//       );
//       // 로그인 성공 시 메인 페이지로 이동
//       Get.off(() => const App());
//     } else {
//       // 로그인 실패 시 에러 메시지 표시
//       Get.snackbar('Error', 'Invalid username or password',
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }

  void _register() {
    // 회원가입 페이지로 이동
    Get.to(() => const RegisterPage());
  }

  Widget _buildUsernameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Image.asset(
              'assets/login_image/user_img.png',
              width: 44,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: const TextStyle(
                  fontSize: 20,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
                  borderSide: const BorderSide(
                    color: Colors.black, // 테두리 색상 설정
                    width: 3, // 테두리 두께 설정
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
                  borderSide: const BorderSide(
                    color: Colors.black, // 테두리 색상 설정
                    width: 3, // 테두리 두께 설정
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Image.asset(
              'assets/login_image/password_img.png',
              width: 44,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(
                  fontSize: 20,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
                  borderSide: const BorderSide(
                    color: Colors.black, // 테두리 색상 설정
                    width: 3, // 테두리 두께 설정
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
                  borderSide: const BorderSide(
                    color: Colors.black, // 테두리 색상 설정
                    width: 3, // 테두리 두께 설정
                  ),
                ),
              ),
              obscureText: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: 300,
        child: TextButton(
          onPressed: _login,
          child: const Text(
            'Login',
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
    );
  }

  Widget _buildRegisterButton() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: 300,
        child: TextButton(
          onPressed: _register,
          child: const Text(
            'Register',
            style: TextStyle(
              color: Color(0xFF4BC27B),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
              side: const BorderSide(
                color: Color(0xFF4BC27B), // 테두리 색상 설정
                width: 4, // 테두리 두께 설정
              ),
            ),
            minimumSize: const Size(300, 50), // 최소 크기 설정
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: const Color(0xFF4BC27B),
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                ),
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Image(
                    image: AssetImage('assets/login_image/SKKULearn.png'),
                    width: 278,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Image(
                    image: AssetImage('assets/login_image/logo.png'),
                    width: 155,
                  ),
                ),
                _buildUsernameField(),
                _buildPasswordField(),
                _buildLoginButton(),
                _buildRegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
