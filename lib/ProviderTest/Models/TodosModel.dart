//package ProviderTest.Models

class TodosModel {
    bool completed;
    int id;
    String title;
    int userId;

    TodosModel({required this.completed, required this.id, required this.title, required this.userId});

    factory TodosModel.fromJson(Map<String, dynamic> json) {
        return TodosModel(
            completed: json['completed'], 
            id: json['id'], 
            title: json['title'], 
            userId: json['userId'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['completed'] = this.completed;
        data['id'] = this.id;
        data['title'] = this.title;
        data['userId'] = this.userId;
        return data;
    }
}