import 'package:dio/dio.dart';
import 'package:untitled/constant/dioDefault.dart';

class DioToDoList {
  var dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future generateToDo(String todoList, String date, String googleId) async {
    final response = await dio.post(
      '${DioDefault.baseURL}/toDoList/add?todoList=${todoList}&date=${date}&googleId=${googleId}',
    );
    print(response.data);
  }

  Future getToDoList(String googleId, String date) async {
    final response = await dio.get(
      '${DioDefault.baseURL}/toDoList?date=${date}&googleId=${googleId}',
    );
    print("getToDoList:" + response.data.toString());
    return response.data;
  }

  Future setToDoTrue(String date, String googleId, String todoList,
      String finishedDate) async {
    final response = await dio.put(
      '${DioDefault.baseURL}/toDoList/check?date=${date}&googleId=${googleId}&todoList=${todoList}&finishedDate=${finishedDate}',
    );
    print("getToDoList:" + response.data.toString());
  }
}
