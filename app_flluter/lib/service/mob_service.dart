import 'package:dio/dio.dart';

class MobService {
  String host = "http://10.0.2.2:8080";

  Dio dio = Dio();

  Future<Response> rand_mob() async {
    try {
      Response response = await dio.get('$host/mob/randmob');
      return response;
    } catch (e) {
      print("몹정보 불러오기중 에러발생");
      rethrow;
    }
  }
}