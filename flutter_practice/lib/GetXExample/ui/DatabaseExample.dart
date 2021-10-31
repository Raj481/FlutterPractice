import 'package:flutter/material.dart';
import 'package:flutter_practice/GetXExample/controllers/TaskController.dart';
import 'package:get/get.dart';


class DatabaseExample extends StatelessWidget {
  // const DatabaseExample({Key? key}) : super(key: key);

  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: TextFormField(
                      controller: _taskController.addTaskController,
                      decoration: InputDecoration(hintText: "Enter a task"),
                    )
                ),
                IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _taskController.addData();
                      }
                    )
              ],
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: _taskController.taskData.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Text(_taskController.taskData[index].title!),
                  trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _taskController.deleteTask(_taskController.taskData[index].id!
                      )
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }

  AppBar getAppbar(){
    return AppBar(
      backgroundColor: const Color(0XFFe5fbff),
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color(0xff113a83),
        ),
        onPressed: (){
          Get.back();
        },
      ),
      centerTitle: true,
      title: const Text(
        "Todo List",
        style: TextStyle(
            color: Color(0xff113a83),
            fontSize: 18
        ),
      ),
    );
  }

}

