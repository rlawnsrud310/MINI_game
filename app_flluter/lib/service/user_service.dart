import 'package:dio/dio.dart';
class UserService {
  String host = "http://10.0.2.2:8080";
  
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
        return true;
      } else{
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
}