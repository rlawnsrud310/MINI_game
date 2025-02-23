import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Map<String, String> obj = {};

  String? id;

  @override
  void initState() {
    super.initState();
    print("HomeScreen이 처음 실행됨!");

    WidgetsBinding.instance.addPostFrameCallback( (_) {
      final args = ModalRoute.of(context)!.settings.arguments;
      obj = args as Map<String, String>;

      setState(() {
        id = obj["id"] as String;
        print("로그인된 아이디 : $id");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 상단 로그인 유저 이름 확인
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text(
                "$id 님 어서오세요",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // 중간 70% - 배경 이미지 + 중앙 버튼
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/mainImage.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      print("전투하기 버튼 클릭");
                      Navigator.pushNamed(context, "/game/battle");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text("전투하기"),
                  ),
                ),
              ],
            ),
          ),

          // 하단 15% - 직사각형 버튼 3개
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Row(
              children: [
                _buildBottomButton("상점"),
                _buildBottomButton("HOME"),
                _buildBottomButton("내정보"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(String text) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          print("$text 버튼 클릭");
        },
        child: Container(
          color: Colors.blueAccent,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
