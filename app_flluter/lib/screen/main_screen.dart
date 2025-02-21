import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("메인"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
          children: [
            ElevatedButton(
              onPressed: () {
                print("로그인 버튼 클릭");
                Navigator.pushNamed(context, "/login");
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text("로그인"),
            ),
            const SizedBox(height: 16), // 버튼 간격 추가
            ElevatedButton(
              onPressed: () {
                print("회원가입 버튼 클릭");
                Navigator.pushNamed(context, "/join");
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text("회원가입"),
            ),
          ],
        ),
      ),
    );
  }
}
