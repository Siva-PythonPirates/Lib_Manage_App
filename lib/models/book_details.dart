import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lib_management/models/serializers.dart';

part 'book_details.g.dart';

abstract class BookDetails implements Built<BookDetails, BookDetailsBuilder> {
  BookDetails._();
  factory BookDetails([void Function(BookDetailsBuilder) updates]) =
      _$BookDetails;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(BookDetails.serializer, this)
        as Map<String, dynamic>;
  }

  static BookDetails fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(BookDetails.serializer, json)!;
  }

  static Serializer<BookDetails> get serializer => _$bookDetailsSerializer;
}
