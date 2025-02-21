import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();

}

class _MyWidgetState extends State<MyWidget> {

  Map<String, dynamic> obj = {};

  @override
  void initState() {
    super.initState();

    mobInfo();
  }

  void mobInfo() async {
    try {
      Response
    } catch (e) {
      print("몹 정보 불러오기 실패");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("테스트"),
      ),
    );
  }
}