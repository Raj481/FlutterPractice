//package ProviderTest.Models

import 'package:flutter_practice/ProviderTest/Models/Geo.dart';

class Address {
    String city;
    Geo geo;
    String street;
    String suite;
    String zipcode;

    Address({required this.city, required this.geo, required this.street, required this.suite, required this.zipcode});

    factory Address.fromJson(Map<String, dynamic> json) {
        return Address(
            city: json['city'], 
            geo:  Geo.fromJson(json['geo']),
            street: json['street'], 
            suite: json['suite'], 
            zipcode: json['zipcode'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['city'] = this.city;
        data['street'] = this.street;
        data['suite'] = this.suite;
        data['zipcode'] = this.zipcode;
        if (this.geo != null) {
            data['geo'] = this.geo.toJson();
        }
        return data;
    }
}