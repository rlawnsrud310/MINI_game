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
  int hp = 0;       // hp
  int? exp;      // 흭득 경험치
  String? files; // 몹IMG
  int MaxHp = 0;

  String? id; // 기본 로그인정보 

  int count = 0;

  @override
  void initState() {
    super.initState();
    mobInfo();

    WidgetsBinding.instance.addPostFrameCallback( (_) {
      final args = ModalRoute.of(context)!.settings.arguments;
      obj = args as Map<String, String>;

      setState(() {
        id = obj["id"] as String;
        print("로그인된 아이디 : $id");
      });
    });
  }

  void Attack() {
    setState(() {
      count++;
      hp = hp! - 10;
      if(hp == 0){
        Navigator.pushNamed(context, "/game/home",
        arguments: {
          "id" : id as String
        });
      }
    });
    print("$count탭!! 잔여 hp : $hp");
  }

  void mobInfo() async {
    try {
      Response<dynamic> response = await mobService.rand_mob();
      print("타입 : ${response.data}");
      var data = response.data;
      setState( () {
        no = data["no"] as int;
        name = data["name"] as String;
        hp = data["hp"] as int;
        MaxHp = hp;
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
                "출현 몬스터 : $name 전투중!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // 중간 70% - 배경 이미지 + 몬스터 사진
          Expanded(
            child: GestureDetector(
              onTap: () {
                Attack();
              },
              child: Stack(
                children: [
                  // 배경 이미지
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/mainImage.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),

                  // HP 바 (상단 중앙)
                  Positioned(
                    top: 20, // 상단 여백 조정
                    left: MediaQuery.of(context).size.width * 0.1, // 좌우 여백 조정
                    right: MediaQuery.of(context).size.width * 0.1,
                    child: Stack(
                      alignment: Alignment.center, // 텍스트 중앙 정렬
                      children: [
                        // 전체 체력바 (소모된 체력 = 빨간색)
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.green, // 전체 체력바 (소모된 부분은 남겨둠)
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                        ),

                        // 남은 체력바 (초록색) - 오른쪽에서 왼쪽으로 줄어듦
                        Align(
                          alignment: Alignment.centerLeft, // 왼쪽 정렬
                          child: FractionallySizedBox(
                            alignment: Alignment.centerRight, // 남은 HP 바가 오른쪽에서 왼쪽으로 줄어들게 설정
                            widthFactor: hp != null && hp! > 0 ? hp! / MaxHp : 0, // HP 비율 계산
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.red, // 남은 체력 부분 (초록색)
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(hp! / MaxHp == 1 ? 10 : 0), // 가득 차 있으면 둥글게 유지
                                  bottomLeft: Radius.circular(hp! / MaxHp == 1 ? 10 : 0),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // 체력 텍스트 (중앙)
                        Text(
                          "$hp / $MaxHp", // 현재 체력 / 최대 체력
                          style: const TextStyle(
                            color: Colors.white, // 글씨 색상 (배경과 대비되도록 흰색)
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            shadows: [
                              Shadow(
                                blurRadius: 2,
                                color: Colors.black, // 검은색 그림자 효과
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),



                  // 몬스터 사진 (가운데 배치)
                  Center(
                    child: Image.asset(
                      '$files',
                      width: 300,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),




          // 하단 15% - 직사각형 버튼 3개
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Row(
              children: [
                _buildBottomButton("도망가기"),
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
          switch(text){
            case "도망가기": Navigator.pushNamed(context, "/game/home",
            arguments: {
              "id" : id as String
            }); 
          }
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
