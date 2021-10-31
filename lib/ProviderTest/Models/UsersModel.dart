//package ProviderTest.Models

import 'Address.dart';
import 'Company.dart';

class UsersModel {
    Address address;
    Company company;
    String email;
    int id;
    String name;
    String phone;
    String username;
    String website;

    UsersModel({required this.address, required this.company, required this.email, required this.id, required this.name, required this.phone, required this.username, required this.website});

    factory UsersModel.fromJson(Map<String, dynamic> json) {
        return UsersModel(
            address: Address.fromJson(json['address']),
            company: Company.fromJson(json['company']) ,
            email: json['email'], 
            id: json['id'], 
            name: json['name'], 
            phone: json['phone'], 
            username: json['username'], 
            website: json['website'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['id'] = this.id;
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['username'] = this.username;
        data['website'] = this.website;
        if (this.address != null) {
            data['address'] = this.address.toJson();
        }
        if (this.company != null) {
            data['company'] = this.company.toJson();
        }
        return data;
    }
}