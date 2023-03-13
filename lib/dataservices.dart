import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'package:lib_management/models/location.dart';

class DataServices {
  Future<BuiltList<Location>?> getlocations() async {
    final response =
        await http.get(Uri.parse('http://mark.bslmeiyu.com/api/getplaces'));
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        final List<Location> l = <Location>[];
        for (final dynamic data in list) {
          final Map<String, dynamic> d = data as Map<String, dynamic>;
          l.add(Location.fromJson(d));
        }
        return l.toBuiltList();
      } else {
        print(response);
      }
    } catch (e) {
      print(e);
    }
  }

  fetchAlbum() async {
    final response =
        await http.get(Uri.parse('http://mark.bslmeiyu.com/api/getplaces'));

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        // print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}

class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;
  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        name: json["name"],
        img: json["img"],
        price: json["price"],
        people: json["people"],
        stars: json["stars"],
        description: json["description"],
        location: json["location"]);
  }
}
