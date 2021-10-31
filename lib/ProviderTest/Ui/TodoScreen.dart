import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/ApiManager/HttpServices.dart';
import 'package:flutter_practice/ProviderTest/Models/PhotosModel.dart';
import 'package:flutter_practice/ProviderTest/Models/TodosModel.dart';
import 'package:flutter_practice/Utils/ColorConstant.dart';
import 'package:flutter_practice/WidgetsUtils/ItemPhotos.dart';
import 'package:http/http.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen() : super();
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  final todoStream = StreamController<TodosModel>();

  Stream<List<PhotosModel>> getRandomNumberFact() async* {

    yield* Stream.periodic(Duration(seconds: 5), (_) async{

      return await getData();
        //HttpServices().getTodos();
    }).asyncMap((event) async => event);
  }

  Future<List<PhotosModel>> getData() async{
    List<PhotosModel> list = <PhotosModel>[];
    Response response = await HttpServices().getPhotos();
    var jsonData = json.decode(response.body);

    for(var i in jsonData){
      list.add(PhotosModel.fromJson(i));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: StreamBuilder(
            stream: getRandomNumberFact(),
              builder:(context,AsyncSnapshot<List<PhotosModel>> snap){

              if(snap.connectionState == ConnectionState.done){

              }

              if(!snap.hasData){

                return CircularProgressIndicator();
              }

                return ListView.builder(
                    itemCount: snap.data!.length,
                    itemBuilder: (BuildContext context,int index){
                      return LikeCounter(snap.data![index]);
                    }
                );
              }
          )
        /*FutureBuilder(
            future: getData(),
            builder:(context,AsyncSnapshot<List<PhotosModel>> snap){
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (BuildContext context,int index){
                    return ItemPhotos(model: snap.data![index]);
                  }
                );
            }
          )*/
      )
    );
  }

}

class LikeCounter extends StatelessWidget {
  final PhotosModel model;

  LikeCounter(this.model);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      duration: Duration(milliseconds: 250),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorsConstant.bisque,
      ),
      child: Container(
        child: Card(
          child: Container(
            padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
            child: Row(
              children: [
                Image.network(
                  model.thumbnailUrl,
                  width: 30,
                  height: 40,
                ),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                  model.title
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Icon(
                        Icons.favorite,
                        color: ColorsConstant.antique_white),
                  ),
                )
              ],
            ),
          ),
        ),
      )
      /*Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.favorite, color: Colors.white),
          Text(
            " ${num.title}",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),*/
    );
  }
}