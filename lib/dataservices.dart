import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataServices{
  fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://mark.bslmeiyu.com/api/getplaces'));

 try{
      if(response.statusCode==200){
        List<dynamic> list = json.decode(response.body);
        // print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
        
      }else{
        return <DataModel>[];
      }

    }catch(e){
      print(e);
      return <DataModel>[];

    }
}
}


class DataModel{
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
  factory DataModel.fromJson(Map<String,dynamic> json){
    return DataModel(name: json["name"],
    img: json["img"],
    price: json["price"], 
    people: json["people"], 
    stars: json["stars"], 
    description: json["description"], 
    location: json["location"]);
  }
}