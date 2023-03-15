import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'package:lib_management/models/location.dart';

class DataServices {
  Future<BuiltList<Location>?> getlocations() async {
    try {
      final response = await http.get(Uri.parse('http://172.16.53.74:3000/viewbooks?page=1'));
      print(response);
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
      return null;
    }
    return null;
  }

  fetchAlbum() async {
    final response = await http.get(Uri.parse('http://mark.bslmeiyu.com/api/getplaces'));

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        print(list.runtimeType);
        print([
          {
            "id": 1,
            "name": "British Columbia",
            "description":
                "This 134 kilometers Highway 99 trail gives you a taste of the Canada mountains, from Horseshoe Bay in the north of Vancouver to Pemberton. ",
            "price": 1276,
            "stars": 4,
            "people": 5,
            "selected_people": 5,
            "img": "images/f9d4b5e088c7bc70b7bbd51cd89e71b6.jpeg",
            "location": "Canada, British Columbia",
            "created_at": "2021-11-17T10:09:08.000000Z",
            "updated_at": "2021-11-19T13:39:55.000000Z"
          },
          {
            "id": 2,
            "name": "Icefields",
            "description":
                "This stretches for a straight 234 kilometers from Banff to Jasper. The Icefields Parkway offers you the picturesque panorama of Alberta\u2019s most talked about mountain vistas. ",
            "price": 2153,
            "stars": 5,
            "people": 5,
            "selected_people": 3,
            "img": "images/1a2d25d3c5ea7912982e37b8005bbebe.jpeg",
            "location": "Icefields, Alberta",
            "created_at": "2021-11-17T10:10:43.000000Z",
            "updated_at": "2021-11-19T14:18:09.000000Z"
          },
          {
            "id": 3,
            "name": "Moraine Lake",
            "description":
                "Moraine Lake is yet another astonishing geographical location that you cannot afford to miss out on if you\u2019re traveling along the Icefields Parkway. ",
            "price": 3456,
            "stars": 3,
            "people": 5,
            "selected_people": 4,
            "img": "images/9a4079ae9e67ca51b9fdf4670a5795f4.jpeg",
            "location": "Moraine Lake, Alberta",
            "created_at": "2021-11-17T10:16:31.000000Z",
            "updated_at": "2021-11-19T13:40:36.000000Z"
          },
          {
            "id": 4,
            "name": "Ontario",
            "description":
                "If you\u2019re in Canada and if you\u2019re a sucker for mountains, Killarney Provincial Park in Ontario is your best catch for Canada mountains near Toronto. ",
            "price": 3312,
            "stars": 4,
            "people": 5,
            "selected_people": 3,
            "img": "images/24fe838b325456a0ca7fc2249409de3f.jpeg",
            "location": "Killarney Provincial Park",
            "created_at": "2021-11-17T10:18:46.000000Z",
            "updated_at": "2021-11-19T13:40:44.000000Z"
          },
          {
            "id": 5,
            "name": "Gaza",
            "description": "Dome of the rock the beautiful and amazing human made architectural.",
            "price": 10,
            "stars": 5,
            "people": 5,
            "selected_people": 4,
            "img": "images/9aaf2377eb3e0978ecb0e17717579a2b.jpg",
            "location": "Palestine, Gaza",
            "created_at": "2021-12-08T12:29:53.000000Z",
            "updated_at": "2021-12-08T12:29:53.000000Z"
          }
        ].runtimeType);
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
