import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _termsAccepted = false;

  Future<void> _register() async {
    // 회원가입 로직을 구현합니다.
    String email = _emailController.text;
    String username = _usernameController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (password == confirmPassword && _termsAccepted) {
      // FastAPI 백엔드로 데이터 전송
      var url =
          Uri.parse('https://yourapi.com/register'); // 여기에 API 엔드포인트 URL 입력
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // 회원가입 성공 로직 추가
        Get.snackbar('Success', 'Register success');
      } else {
        // 회원가입 실패 시 에러 메시지 표시
        Get.snackbar('Error', 'Register failed: ${response.body}');
      }
    } else if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('You must accept the terms and privacy policy')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
    }
  }

  Widget _buildUsernameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Username',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4BC27B),
              ),
            ),
          ),
          Row(
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
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Email',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4BC27B),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Image.asset(
                  'assets/login_image/mail_img.png',
                  width: 44,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
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
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Password',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4BC27B),
              ),
            ),
          ),
          Row(
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
        ],
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Password Recheck',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4BC27B),
              ),
            ),
          ),
          Row(
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
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Password Recheck',
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
        ],
      ),
    );
  }

  Widget _buildTermsAndPolicyCheckbox() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Checkbox(
            value: _termsAccepted,
            onChanged: (bool? value) {
              setState(() {
                _termsAccepted = value!;
              });
            },
          ),
          const Expanded(
            child: Text(
              'I accept the terms and privacy policy',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Center(
      child: Padding(
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
      ),
    );
  }

  Widget _buildLoginLink() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account? ',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          InkWell(
            onTap: () {
              Get.back(); // GetX를 사용하여 이전 페이지로 돌아갑니다.
            },
            child: const Text(
              'Log in',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF4BC27B),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, // 추가
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25, bottom: 50, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft, // 왼쪽 정렬
                  child: Text(
                    'Create account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900, // 글씨 더 두껍게
                      color: Color(0xFF4BC27B),
                    ),
                  ),
                ),
              ),
              _buildUsernameField(),
              _buildEmailField(),
              _buildPasswordField(),
              _buildConfirmPasswordField(),
              _buildTermsAndPolicyCheckbox(),
              _buildRegisterButton(),
              _buildLoginLink(),
            ],
          ),
        ),
      ),
    );
  }
}
