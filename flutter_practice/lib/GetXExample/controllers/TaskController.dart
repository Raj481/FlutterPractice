import 'package:flutter/material.dart';
import 'package:flutter_practice/GetXExample/Models/TaskData.dart';
import 'package:flutter_practice/GetXExample/database/DatabaseHelper.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var taskData = <TaskData>[].obs;
  TextEditingController? addTaskController;

  @override
  void onInit() {
    addTaskController = TextEditingController();
    _getData();
    super.onInit();
  }
  void _getData() {
    DatabaseHelper.instance.queryAllRows().then((value) {
      value.forEach((element) {
        taskData.add(TaskData(id: element['id'], title: element['title']));
      });
    });
  }

  void addData() async {
    await DatabaseHelper.instance.insert(TaskData(title: addTaskController!.text));
    taskData.insert(
        0, TaskData(id: taskData.length, title: addTaskController!.text));
    addTaskController!.clear();
  }

  void deleteTask(int id) async {
    await DatabaseHelper.instance.delete(id);
    taskData.removeWhere((element) => element.id == id);
  }
}