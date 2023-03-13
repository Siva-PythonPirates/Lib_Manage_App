import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lib_management/models/serializers.dart';

part 'location.g.dart';

abstract class Location implements Built<Location, LocationBuilder> {


  Location._();
  factory Location([void Function(LocationBuilder) updates]) = _$Location;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Location.serializer, this) as Map<String,dynamic>;
  }

  static Location fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Location.serializer, json)!;
  }

  static Serializer<Location> get serializer => _$locationSerializer;

  String? get name;
  String? get img;
  int? get price;
  int? get people;
  int? get stars;
  String? get description;
  String? get location;
}