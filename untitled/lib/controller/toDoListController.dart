import 'package:get/get.dart';
import 'package:untitled/data/model/toDoListNode.dart';

class ToDoListController extends GetxController {
  List<ToDoListNode> toDoList = [];

  void setToDoListNodeList(List<ToDoListNode> _toDoList) {
    toDoList = _toDoList;
    print("set toDoList data: " + toDoList.toString());
  }
}
