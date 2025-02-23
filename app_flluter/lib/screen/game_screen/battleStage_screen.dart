import 'package:flutter/material.dart';
import 'package:app_flluter/service/mob_service.dart';
import 'package:dio/dio.dart';

class BattlestageScreen extends StatefulWidget {
  const BattlestageScreen({super.key});

  @override
  State<BattlestageScreen> createState() => _BattlestageScreenState();

}

class _BattlestageScreenState extends State<BattlestageScreen> {
  MobService mobService = MobService(); 

  Map<String, dynamic> obj = {};

  int? no;       // 몹 번호
  String? name;  // 몹 이름
  int? hp;       // hp
  int? exp;      // 흭득 경험치
  String? files; // 몹IMG

  @override
  void initState() {
    super.initState();
    mobInfo();
  }

  void mobInfo() async {
    try {
      Response response = await mobService.rand_mob();
      var data = response.data;
      setState( () {
        no = data["no"] as int;
        name = data["name"] as String;
        hp = data["hp"] as int;
        exp = data["exp"] as int;
        files =  data["files"] as String;
      });
    } catch (e) {
      print("몹 정보 불러오기 실패");
    }
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
                "전투중",
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
                      print("중앙 버튼 클릭");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text("시작하기"),
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
