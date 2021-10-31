

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/ProviderTest/Models/PhotosModel.dart';

class ItemPhotos extends StatefulWidget {

  late PhotosModel model;
  ItemPhotos({required this.model}) : super();

  @override
  _ItemPhotosState createState() => _ItemPhotosState();
}

class _ItemPhotosState extends State<ItemPhotos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Card(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Row(
            children: [
              Image.network(
                widget.model.thumbnailUrl,
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
                              widget.model.title
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
