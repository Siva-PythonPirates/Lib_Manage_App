// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookDetails> _$bookDetailsSerializer = new _$BookDetailsSerializer();

class _$BookDetailsSerializer implements StructuredSerializer<BookDetails> {
  @override
  final Iterable<Type> types = const [BookDetails, _$BookDetails];
  @override
  final String wireName = 'BookDetails';

  @override
  Iterable<Object?> serialize(Serializers serializers, BookDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  BookDetails deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new BookDetailsBuilder().build();
  }
}

class _$BookDetails extends BookDetails {
  factory _$BookDetails([void Function(BookDetailsBuilder)? updates]) =>
      (new BookDetailsBuilder()..update(updates))._build();

  _$BookDetails._() : super._();

  @override
  BookDetails rebuild(void Function(BookDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookDetailsBuilder toBuilder() => new BookDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookDetails;
  }

  @override
  int get hashCode {
    return 472564666;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'BookDetails').toString();
  }
}

class BookDetailsBuilder implements Builder<BookDetails, BookDetailsBuilder> {
  _$BookDetails? _$v;

  BookDetailsBuilder();

  @override
  void replace(BookDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookDetails;
  }

  @override
  void update(void Function(BookDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BookDetails build() => _build();

  _$BookDetails _build() {
    final _$result = _$v ?? new _$BookDetails._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
