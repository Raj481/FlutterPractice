import 'package:flutter/material.dart';
import 'package:flutter_practice/GetXExample/controllers/GetxHomeController.dart';
import 'package:get/get.dart';

class ApiGetXSample extends StatefulWidget {
  const ApiGetXSample({Key? key}) : super(key: key);

  @override
  _ApiGetXSampleState createState() => _ApiGetXSampleState();
}

class _ApiGetXSampleState extends State<ApiGetXSample> {

  final homeController = Get.put(GetxHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: getBody(),
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
        "Api Sample",
        style: TextStyle(
            color: Color(0xff113a83),
            fontSize: 18
        ),
      ),
    );
  }

  Widget getBody(){

    return Container(
      child:  GetX<GetxHomeController>(
        builder: (controller){
          return ListView.builder(
              itemCount: controller.posts.length,
              itemBuilder: (context,index){
                return Card(
                  shadowColor: Color(0xff000000),
                  child: MaterialButton(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "${controller.posts.elementAt(index).title}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    onPressed: (){
                      setState(() {
                        controller.posts.removeAt(index);
                      });
                    },
                  ),
                );
              }
          );
        },
      ),
    );

  }

}
