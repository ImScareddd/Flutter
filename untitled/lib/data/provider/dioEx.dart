import 'package:dio/dio.dart';
import 'package:untitled/constant/dioDefault.dart';

class DioEx {
  var dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
  getEx() async {
    final response = await dio.get(
        'https://velog.io/@leeeeeoy/Flutter-Dio-%EA%B0%84%EB%8B%A8-%EC%A0%95%EB%A6%AC');
    print("obj");
    print(response);
  }

  postEx() async {
    print("obj");
    final response = await dio.post(
      '${DioDefault.baseURL}login?name=강병헌&email=fund88@naver.com&googleId=12125125125',
    );
    print("obj");
    print(response);
  }
}
