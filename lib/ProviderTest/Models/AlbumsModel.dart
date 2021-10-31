//package ProviderTest.Models

class AlbumsModel {
    int id;
    String title;
    int userId;

    AlbumsModel({required this.id, required this.title, required this.userId});

    factory AlbumsModel.fromJson(Map<String, dynamic> json) {
        return AlbumsModel(
            id: json['id'], 
            title: json['title'], 
            userId: json['userId'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['title'] = this.title;
        data['userId'] = this.userId;
        return data;
    }
}