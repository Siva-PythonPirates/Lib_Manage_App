// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Location> _$locationSerializer = new _$LocationSerializer();

class _$LocationSerializer implements StructuredSerializer<Location> {
  @override
  final Iterable<Type> types = const [Location, _$Location];
  @override
  final String wireName = 'Location';

  @override
  Iterable<Object?> serialize(Serializers serializers, Location object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.SLNO;
    if (value != null) {
      result
        ..add('SLNO')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.AUTHORS;
    if (value != null) {
      result
        ..add('AUTHORS')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.TITLE;
    if (value != null) {
      result
        ..add('TITLE')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.EDITION;
    if (value != null) {
      result
        ..add('EDITION')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.YEAR;
    if (value != null) {
      result
        ..add('YEAR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.PUBLISHER;
    if (value != null) {
      result
        ..add('PUBLISHER')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.SERIES;
    if (value != null) {
      result
        ..add('SERIES')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.PAGES;
    if (value != null) {
      result
        ..add('PAGES')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.PRICE_FOREIGN;
    if (value != null) {
      result
        ..add('PRICE_FOREIGN')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.PRICE_INR;
    if (value != null) {
      result
        ..add('PRICE_INR')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.P;
    if (value != null) {
      result
        ..add('P')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ISBN;
    if (value != null) {
      result
        ..add('ISBN')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Location deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'SLNO':
          result.SLNO = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'AUTHORS':
          result.AUTHORS = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'TITLE':
          result.TITLE = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'EDITION':
          result.EDITION = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'YEAR':
          result.YEAR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'PUBLISHER':
          result.PUBLISHER = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'SERIES':
          result.SERIES = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'PAGES':
          result.PAGES = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'PRICE_FOREIGN':
          result.PRICE_FOREIGN = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'PRICE_INR':
          result.PRICE_INR = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'P':
          result.P = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ISBN':
          result.ISBN = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Location extends Location {
  @override
  final int? SLNO;
  @override
  final String? AUTHORS;
  @override
  final String? TITLE;
  @override
  final int? EDITION;
  @override
  final int? YEAR;
  @override
  final String? PUBLISHER;
  @override
  final String? SERIES;
  @override
  final String? PAGES;
  @override
  final String? PRICE_FOREIGN;
  @override
  final int? PRICE_INR;
  @override
  final String? P;
  @override
  final String? ISBN;

  factory _$Location([void Function(LocationBuilder)? updates]) =>
      (new LocationBuilder()..update(updates))._build();

  _$Location._(
      {this.SLNO,
      this.AUTHORS,
      this.TITLE,
      this.EDITION,
      this.YEAR,
      this.PUBLISHER,
      this.SERIES,
      this.PAGES,
      this.PRICE_FOREIGN,
      this.PRICE_INR,
      this.P,
      this.ISBN})
      : super._();

  @override
  Location rebuild(void Function(LocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationBuilder toBuilder() => new LocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Location &&
        SLNO == other.SLNO &&
        AUTHORS == other.AUTHORS &&
        TITLE == other.TITLE &&
        EDITION == other.EDITION &&
        YEAR == other.YEAR &&
        PUBLISHER == other.PUBLISHER &&
        SERIES == other.SERIES &&
        PAGES == other.PAGES &&
        PRICE_FOREIGN == other.PRICE_FOREIGN &&
        PRICE_INR == other.PRICE_INR &&
        P == other.P &&
        ISBN == other.ISBN;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, SLNO.hashCode);
    _$hash = $jc(_$hash, AUTHORS.hashCode);
    _$hash = $jc(_$hash, TITLE.hashCode);
    _$hash = $jc(_$hash, EDITION.hashCode);
    _$hash = $jc(_$hash, YEAR.hashCode);
    _$hash = $jc(_$hash, PUBLISHER.hashCode);
    _$hash = $jc(_$hash, SERIES.hashCode);
    _$hash = $jc(_$hash, PAGES.hashCode);
    _$hash = $jc(_$hash, PRICE_FOREIGN.hashCode);
    _$hash = $jc(_$hash, PRICE_INR.hashCode);
    _$hash = $jc(_$hash, P.hashCode);
    _$hash = $jc(_$hash, ISBN.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Location')
          ..add('SLNO', SLNO)
          ..add('AUTHORS', AUTHORS)
          ..add('TITLE', TITLE)
          ..add('EDITION', EDITION)
          ..add('YEAR', YEAR)
          ..add('PUBLISHER', PUBLISHER)
          ..add('SERIES', SERIES)
          ..add('PAGES', PAGES)
          ..add('PRICE_FOREIGN', PRICE_FOREIGN)
          ..add('PRICE_INR', PRICE_INR)
          ..add('P', P)
          ..add('ISBN', ISBN))
        .toString();
  }
}

class LocationBuilder implements Builder<Location, LocationBuilder> {
  _$Location? _$v;

  int? _SLNO;
  int? get SLNO => _$this._SLNO;
  set SLNO(int? SLNO) => _$this._SLNO = SLNO;

  String? _AUTHORS;
  String? get AUTHORS => _$this._AUTHORS;
  set AUTHORS(String? AUTHORS) => _$this._AUTHORS = AUTHORS;

  String? _TITLE;
  String? get TITLE => _$this._TITLE;
  set TITLE(String? TITLE) => _$this._TITLE = TITLE;

  int? _EDITION;
  int? get EDITION => _$this._EDITION;
  set EDITION(int? EDITION) => _$this._EDITION = EDITION;

  int? _YEAR;
  int? get YEAR => _$this._YEAR;
  set YEAR(int? YEAR) => _$this._YEAR = YEAR;

  String? _PUBLISHER;
  String? get PUBLISHER => _$this._PUBLISHER;
  set PUBLISHER(String? PUBLISHER) => _$this._PUBLISHER = PUBLISHER;

  String? _SERIES;
  String? get SERIES => _$this._SERIES;
  set SERIES(String? SERIES) => _$this._SERIES = SERIES;

  String? _PAGES;
  String? get PAGES => _$this._PAGES;
  set PAGES(String? PAGES) => _$this._PAGES = PAGES;

  String? _PRICE_FOREIGN;
  String? get PRICE_FOREIGN => _$this._PRICE_FOREIGN;
  set PRICE_FOREIGN(String? PRICE_FOREIGN) =>
      _$this._PRICE_FOREIGN = PRICE_FOREIGN;

  int? _PRICE_INR;
  int? get PRICE_INR => _$this._PRICE_INR;
  set PRICE_INR(int? PRICE_INR) => _$this._PRICE_INR = PRICE_INR;

  String? _P;
  String? get P => _$this._P;
  set P(String? P) => _$this._P = P;

  String? _ISBN;
  String? get ISBN => _$this._ISBN;
  set ISBN(String? ISBN) => _$this._ISBN = ISBN;

  LocationBuilder();

  LocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _SLNO = $v.SLNO;
      _AUTHORS = $v.AUTHORS;
      _TITLE = $v.TITLE;
      _EDITION = $v.EDITION;
      _YEAR = $v.YEAR;
      _PUBLISHER = $v.PUBLISHER;
      _SERIES = $v.SERIES;
      _PAGES = $v.PAGES;
      _PRICE_FOREIGN = $v.PRICE_FOREIGN;
      _PRICE_INR = $v.PRICE_INR;
      _P = $v.P;
      _ISBN = $v.ISBN;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Location other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Location;
  }

  @override
  void update(void Function(LocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Location build() => _build();

  _$Location _build() {
    final _$result = _$v ??
        new _$Location._(
            SLNO: SLNO,
            AUTHORS: AUTHORS,
            TITLE: TITLE,
            EDITION: EDITION,
            YEAR: YEAR,
            PUBLISHER: PUBLISHER,
            SERIES: SERIES,
            PAGES: PAGES,
            PRICE_FOREIGN: PRICE_FOREIGN,
            PRICE_INR: PRICE_INR,
            P: P,
            ISBN: ISBN);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
