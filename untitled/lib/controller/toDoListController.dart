import 'package:get/get.dart';
import 'package:untitled/controller/loginDataController.dart';
import 'package:untitled/data/model/toDoListNode.dart';
import 'package:untitled/data/provider/dioToDoList.dart';

class ToDoListController extends GetxController {
  DioToDoList dioToDoList = DioToDoList();

  List<ToDoListNode> toDoList = [
    // ToDoListNode('나무톤 참석', false),
    // ToDoListNode('인프런 머신러닝 섹션 6수강', false),
    // ToDoListNode('진아 점심 약속', false)
  ];

  void setToDoListNodeList(String date) async {
    String id = Get.find<LoginDataController>().account!.id;
    List result = await dioToDoList.getToDoList(id, date);
    toDoList = [];
    for (int i = 0; i < result.length; i++) {
      toDoList.add(ToDoListNode(
          result[i]["id"], result[i]["status"] == 1, result[i]["todoList"]));
    }
    print("set toDoList data: " + toDoList.toString());
    update();
  }

  void addToDoListNode(String date, String todo) async {
    String id = Get.find<LoginDataController>().account!.id;
    await dioToDoList.generateToDo(todo, date, id);

    setToDoListNodeList(date);
  }

  void setToDoListNodeBool(
      int i, String date, String todo, String finishedDate) async {
    toDoList[i].isFinished = true;
    String id = Get.find<LoginDataController>().account!.id;
    await dioToDoList.setToDoTrue(date, id, todo, finishedDate);
    update();
  }
}
