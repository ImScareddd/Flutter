import 'package:dio/dio.dart';
import 'package:untitled/constant/dioDefault.dart';

class DioLogin {
  var dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  post(String name, String email, String googleId) async {
    final response = await dio.post(
      '${DioDefault.baseURL}/login?name=${name}&email=${email}&googleId=${googleId}',
    );
    print(response.data);
  }
}
