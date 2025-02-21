import 'package:app_flluter/service/user_service.dart';
import 'package:flutter/material.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? _errorMessage; // 🔴 경고 문구 상태 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("회원가입")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_errorMessage != null) // 🔴 에러 메시지가 있을 때만 표시
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            _buildInputField("ID", _idController),
            const SizedBox(height: 16),
            _buildInputField("비밀번호", _pwController, isPassword: true),
            const SizedBox(height: 16),
            _buildInputField("이름", _nameController),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  join();
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("회원가입"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  UserService userService = UserService();

  void join() async {
    print("회원가입 버튼 클릭");
    String id = _idController.text;
    String pw = _pwController.text;
    String name = _nameController.text;

    if (id.isEmpty || pw.isEmpty || name.isEmpty) {
      setState(() {
        _errorMessage = "빈 값이 있습니다.";
      });
      return;
    }

    bool result = await userService.join(id, pw, name);
    if (result) {
      print("성공");
      setState(() {
        _errorMessage = null;
      });
      Navigator.pushReplacementNamed(context, "/login");
    } else {
      print("실패");
      setState(() {
        _errorMessage = "회원가입에 실패했습니다. 다시 시도하세요."; 
      });
    }
  }
}
