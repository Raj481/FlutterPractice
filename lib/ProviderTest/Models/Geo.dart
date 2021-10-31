//package ProviderTest.Models

class Geo {
    String lat;
    String lng;

    Geo({required this.lat, required this.lng});

    factory Geo.fromJson(Map<String, dynamic> json) {
        return Geo(
            lat: json['lat'], 
            lng: json['lng'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['lat'] = this.lat;
        data['lng'] = this.lng;
        return data;
    }
}