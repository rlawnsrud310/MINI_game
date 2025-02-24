import 'package:dio/dio.dart';
class UserService {
  // String host = "http://10.0.2.2:8080";
  // String host = "http://localhost:8080"; // 웹 접속 IP
  String host = "http://182.218.50.145:5200"; // 개인 Spring IP

  
  Dio dio = Dio();
  // 회원가입
  Future<bool> join(String id, String pw, String name) async {
    Map<String, String> data = {
      "id" : id,
      "pw" : pw,
      "name" : name
    };
    print("회원가입 요청 : $data");
    try {
      final response = await dio.post('$host/user/join', data : data);
      if(response.statusCode == 200 || response.statusCode == 201){
        print("회원가입 성공");
        return true;
      } else{
        print("회원가입 실패");
        return false;
      }
    } catch (e) {
      print("회원가입 요청실패");
      return false;
    }
  }

  Future<bool> login(String id, String pw) async {
    Map<String, String> data = {
      "id" : id,
      "pw" : pw
    };
    try {
      final response = await dio.put('$host/user/login', data : data);
      if(response.statusCode == 200){
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
  // 유저 정보 꺼내기
  Future<Response> getUesrs(String id) async {
    Map<String, String> data = {
      "id" : id
    };
    try {
      Response response = await dio.get('$host/user/selectId', data : data);
      print("유저 정보 : ${response.data}");
      return response;
    } catch (e) {
      print("유저정보 불러오기중 에러발생");
      rethrow;
    }
  }
}