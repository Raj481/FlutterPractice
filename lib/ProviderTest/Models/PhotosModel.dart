//package ProviderTest.Models

class PhotosModel {
    int albumId;
    int id;
    String thumbnailUrl;
    String title;
    String url;

    PhotosModel({required this.albumId, required this.id, required this.thumbnailUrl, required this.title, required this.url});

    factory PhotosModel.fromJson(Map<String, dynamic> json) {
        return PhotosModel(
            albumId: json['albumId'], 
            id: json['id'], 
            thumbnailUrl: json['thumbnailUrl'], 
            title: json['title'], 
            url: json['url'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['albumId'] = this.albumId;
        data['id'] = this.id;
        data['thumbnailUrl'] = this.thumbnailUrl;
        data['title'] = this.title;
        data['url'] = this.url;
        return data;
    }
}