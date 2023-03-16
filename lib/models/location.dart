import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lib_management/models/serializers.dart';

part 'location.g.dart';

abstract class Location implements Built<Location, LocationBuilder> {
  Location._();
  factory Location([void Function(LocationBuilder) updates]) = _$Location;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Location.serializer, this)
        as Map<String, dynamic>;
  }

  static Location fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Location.serializer, json)!;
  }

  static Serializer<Location> get serializer => _$locationSerializer;

  int? get SLNO;
  String? get AUTHORS;
  String? get TITLE;
  int? get EDITION;
  int? get YEAR;
  String? get PUBLISHER;
  String? get SERIES;
  String? get PAGES;
  String? get PRICE_FOREIGN;
  int? get PRICE_INR;
  String? get P;
  String? get ISBN;

 compareToTitle(Location b) {
   return this.TITLE!.compareTo(b.TITLE!);
 }
 compareToAuthor(Location b) {
   return (this.AUTHORS??" ").compareTo(this.AUTHORS??" ");
 }
 
 compareToDepartment(Location b) {
   return (this.PUBLISHER??" ").compareTo(this.PUBLISHER??" ");
 }
 
 
}
/*String? get name;
  String? get img;
  int? get price;
  int? get people;
  int? get stars;
  String? get description;
  String? get location;*/
