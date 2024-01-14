// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Test _$TestFromJson(Map<String, dynamic> json) {
  return _Test.fromJson(json);
}

/// @nodoc
mixin _$Test {
  String? get Hello => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestCopyWith<Test> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestCopyWith<$Res> {
  factory $TestCopyWith(Test value, $Res Function(Test) then) =
      _$TestCopyWithImpl<$Res, Test>;
  @useResult
  $Res call({String? Hello});
}

/// @nodoc
class _$TestCopyWithImpl<$Res, $Val extends Test>
    implements $TestCopyWith<$Res> {
  _$TestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Hello = freezed,
  }) {
    return _then(_value.copyWith(
      Hello: freezed == Hello
          ? _value.Hello
          : Hello // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestImplCopyWith<$Res> implements $TestCopyWith<$Res> {
  factory _$$TestImplCopyWith(
          _$TestImpl value, $Res Function(_$TestImpl) then) =
      __$$TestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? Hello});
}

/// @nodoc
class __$$TestImplCopyWithImpl<$Res>
    extends _$TestCopyWithImpl<$Res, _$TestImpl>
    implements _$$TestImplCopyWith<$Res> {
  __$$TestImplCopyWithImpl(_$TestImpl _value, $Res Function(_$TestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Hello = freezed,
  }) {
    return _then(_$TestImpl(
      Hello: freezed == Hello
          ? _value.Hello
          : Hello // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestImpl with DiagnosticableTreeMixin implements _Test {
  const _$TestImpl({this.Hello});

  factory _$TestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestImplFromJson(json);

  @override
  final String? Hello;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Test(Hello: $Hello)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Test'))
      ..add(DiagnosticsProperty('Hello', Hello));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestImpl &&
            (identical(other.Hello, Hello) || other.Hello == Hello));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, Hello);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestImplCopyWith<_$TestImpl> get copyWith =>
      __$$TestImplCopyWithImpl<_$TestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestImplToJson(
      this,
    );
  }
}

abstract class _Test implements Test {
  const factory _Test({final String? Hello}) = _$TestImpl;

  factory _Test.fromJson(Map<String, dynamic> json) = _$TestImpl.fromJson;

  @override
  String? get Hello;
  @override
  @JsonKey(ignore: true)
  _$$TestImplCopyWith<_$TestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMsg _$ChatMsgFromJson(Map<String, dynamic> json) {
  return _ChatMsg.fromJson(json);
}

/// @nodoc
mixin _$ChatMsg {
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMsgCopyWith<ChatMsg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMsgCopyWith<$Res> {
  factory $ChatMsgCopyWith(ChatMsg value, $Res Function(ChatMsg) then) =
      _$ChatMsgCopyWithImpl<$Res, ChatMsg>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$ChatMsgCopyWithImpl<$Res, $Val extends ChatMsg>
    implements $ChatMsgCopyWith<$Res> {
  _$ChatMsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMsgImplCopyWith<$Res> implements $ChatMsgCopyWith<$Res> {
  factory _$$ChatMsgImplCopyWith(
          _$ChatMsgImpl value, $Res Function(_$ChatMsgImpl) then) =
      __$$ChatMsgImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ChatMsgImplCopyWithImpl<$Res>
    extends _$ChatMsgCopyWithImpl<$Res, _$ChatMsgImpl>
    implements _$$ChatMsgImplCopyWith<$Res> {
  __$$ChatMsgImplCopyWithImpl(
      _$ChatMsgImpl _value, $Res Function(_$ChatMsgImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ChatMsgImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMsgImpl with DiagnosticableTreeMixin implements _ChatMsg {
  const _$ChatMsgImpl({this.message});

  factory _$ChatMsgImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMsgImplFromJson(json);

  @override
  final String? message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatMsg(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatMsg'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMsgImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMsgImplCopyWith<_$ChatMsgImpl> get copyWith =>
      __$$ChatMsgImplCopyWithImpl<_$ChatMsgImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMsgImplToJson(
      this,
    );
  }
}

abstract class _ChatMsg implements ChatMsg {
  const factory _ChatMsg({final String? message}) = _$ChatMsgImpl;

  factory _ChatMsg.fromJson(Map<String, dynamic> json) = _$ChatMsgImpl.fromJson;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ChatMsgImplCopyWith<_$ChatMsgImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Chatreply _$ChatreplyFromJson(Map<String, dynamic> json) {
  return _Chatreply.fromJson(json);
}

/// @nodoc
mixin _$Chatreply {
  List<String> get message => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  String get best_time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatreplyCopyWith<Chatreply> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatreplyCopyWith<$Res> {
  factory $ChatreplyCopyWith(Chatreply value, $Res Function(Chatreply) then) =
      _$ChatreplyCopyWithImpl<$Res, Chatreply>;
  @useResult
  $Res call({List<String> message, String rating, String best_time});
}

/// @nodoc
class _$ChatreplyCopyWithImpl<$Res, $Val extends Chatreply>
    implements $ChatreplyCopyWith<$Res> {
  _$ChatreplyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? rating = null,
    Object? best_time = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      best_time: null == best_time
          ? _value.best_time
          : best_time // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatreplyImplCopyWith<$Res>
    implements $ChatreplyCopyWith<$Res> {
  factory _$$ChatreplyImplCopyWith(
          _$ChatreplyImpl value, $Res Function(_$ChatreplyImpl) then) =
      __$$ChatreplyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> message, String rating, String best_time});
}

/// @nodoc
class __$$ChatreplyImplCopyWithImpl<$Res>
    extends _$ChatreplyCopyWithImpl<$Res, _$ChatreplyImpl>
    implements _$$ChatreplyImplCopyWith<$Res> {
  __$$ChatreplyImplCopyWithImpl(
      _$ChatreplyImpl _value, $Res Function(_$ChatreplyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? rating = null,
    Object? best_time = null,
  }) {
    return _then(_$ChatreplyImpl(
      message: null == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      best_time: null == best_time
          ? _value.best_time
          : best_time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatreplyImpl with DiagnosticableTreeMixin implements _Chatreply {
  const _$ChatreplyImpl(
      {required final List<String> message,
      required this.rating,
      required this.best_time})
      : _message = message;

  factory _$ChatreplyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatreplyImplFromJson(json);

  final List<String> _message;
  @override
  List<String> get message {
    if (_message is EqualUnmodifiableListView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_message);
  }

  @override
  final String rating;
  @override
  final String best_time;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Chatreply(message: $message, rating: $rating, best_time: $best_time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Chatreply'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('best_time', best_time));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatreplyImpl &&
            const DeepCollectionEquality().equals(other._message, _message) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.best_time, best_time) ||
                other.best_time == best_time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_message), rating, best_time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatreplyImplCopyWith<_$ChatreplyImpl> get copyWith =>
      __$$ChatreplyImplCopyWithImpl<_$ChatreplyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatreplyImplToJson(
      this,
    );
  }
}

abstract class _Chatreply implements Chatreply {
  const factory _Chatreply(
      {required final List<String> message,
      required final String rating,
      required final String best_time}) = _$ChatreplyImpl;

  factory _Chatreply.fromJson(Map<String, dynamic> json) =
      _$ChatreplyImpl.fromJson;

  @override
  List<String> get message;
  @override
  String get rating;
  @override
  String get best_time;
  @override
  @JsonKey(ignore: true)
  _$$ChatreplyImplCopyWith<_$ChatreplyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Places _$PlacesFromJson(Map<String, dynamic> json) {
  return _Places.fromJson(json);
}

/// @nodoc
mixin _$Places {
  List<Place> get places => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacesCopyWith<Places> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacesCopyWith<$Res> {
  factory $PlacesCopyWith(Places value, $Res Function(Places) then) =
      _$PlacesCopyWithImpl<$Res, Places>;
  @useResult
  $Res call({List<Place> places});
}

/// @nodoc
class _$PlacesCopyWithImpl<$Res, $Val extends Places>
    implements $PlacesCopyWith<$Res> {
  _$PlacesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
  }) {
    return _then(_value.copyWith(
      places: null == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlacesImplCopyWith<$Res> implements $PlacesCopyWith<$Res> {
  factory _$$PlacesImplCopyWith(
          _$PlacesImpl value, $Res Function(_$PlacesImpl) then) =
      __$$PlacesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Place> places});
}

/// @nodoc
class __$$PlacesImplCopyWithImpl<$Res>
    extends _$PlacesCopyWithImpl<$Res, _$PlacesImpl>
    implements _$$PlacesImplCopyWith<$Res> {
  __$$PlacesImplCopyWithImpl(
      _$PlacesImpl _value, $Res Function(_$PlacesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
  }) {
    return _then(_$PlacesImpl(
      places: null == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlacesImpl with DiagnosticableTreeMixin implements _Places {
  const _$PlacesImpl({required final List<Place> places}) : _places = places;

  factory _$PlacesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlacesImplFromJson(json);

  final List<Place> _places;
  @override
  List<Place> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Places(places: $places)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Places'))
      ..add(DiagnosticsProperty('places', places));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacesImpl &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_places));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacesImplCopyWith<_$PlacesImpl> get copyWith =>
      __$$PlacesImplCopyWithImpl<_$PlacesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlacesImplToJson(
      this,
    );
  }
}

abstract class _Places implements Places {
  const factory _Places({required final List<Place> places}) = _$PlacesImpl;

  factory _Places.fromJson(Map<String, dynamic> json) = _$PlacesImpl.fromJson;

  @override
  List<Place> get places;
  @override
  @JsonKey(ignore: true)
  _$$PlacesImplCopyWith<_$PlacesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

/// @nodoc
mixin _$Place {
  String get id => throw _privateConstructorUsedError;
  String get image_url => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res, Place>;
  @useResult
  $Res call(
      {String id, String image_url, Location location, String description});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res, $Val extends Place>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image_url = null,
    Object? location = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image_url: null == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceImplCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$PlaceImplCopyWith(
          _$PlaceImpl value, $Res Function(_$PlaceImpl) then) =
      __$$PlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String image_url, Location location, String description});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$PlaceImplCopyWithImpl<$Res>
    extends _$PlaceCopyWithImpl<$Res, _$PlaceImpl>
    implements _$$PlaceImplCopyWith<$Res> {
  __$$PlaceImplCopyWithImpl(
      _$PlaceImpl _value, $Res Function(_$PlaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image_url = null,
    Object? location = null,
    Object? description = null,
  }) {
    return _then(_$PlaceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image_url: null == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceImpl with DiagnosticableTreeMixin implements _Place {
  const _$PlaceImpl(
      {required this.id,
      required this.image_url,
      required this.location,
      required this.description});

  factory _$PlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceImplFromJson(json);

  @override
  final String id;
  @override
  final String image_url;
  @override
  final Location location;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Place(id: $id, image_url: $image_url, location: $location, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Place'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('image_url', image_url))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image_url, image_url) ||
                other.image_url == image_url) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, image_url, location, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      __$$PlaceImplCopyWithImpl<_$PlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceImplToJson(
      this,
    );
  }
}

abstract class _Place implements Place {
  const factory _Place(
      {required final String id,
      required final String image_url,
      required final Location location,
      required final String description}) = _$PlaceImpl;

  factory _Place.fromJson(Map<String, dynamic> json) = _$PlaceImpl.fromJson;

  @override
  String get id;
  @override
  String get image_url;
  @override
  Location get location;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  String get name => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  Position get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call({String name, String city, String country, Position position});

  $PositionCopyWith<$Res> get position;
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? city = null,
    Object? country = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res> get position {
    return $PositionCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String city, String country, Position position});

  @override
  $PositionCopyWith<$Res> get position;
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? city = null,
    Object? country = null,
    Object? position = null,
  }) {
    return _then(_$LocationImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl with DiagnosticableTreeMixin implements _Location {
  const _$LocationImpl(
      {required this.name,
      required this.city,
      required this.country,
      required this.position});

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final String name;
  @override
  final String city;
  @override
  final String country;
  @override
  final Position position;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Location(name: $name, city: $city, country: $country, position: $position)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Location'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('country', country))
      ..add(DiagnosticsProperty('position', position));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, city, country, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {required final String name,
      required final String city,
      required final String country,
      required final Position position}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  String get name;
  @override
  String get city;
  @override
  String get country;
  @override
  Position get position;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Position _$PositionFromJson(Map<String, dynamic> json) {
  return _Position.fromJson(json);
}

/// @nodoc
mixin _$Position {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionCopyWith<Position> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionCopyWith<$Res> {
  factory $PositionCopyWith(Position value, $Res Function(Position) then) =
      _$PositionCopyWithImpl<$Res, Position>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$PositionCopyWithImpl<$Res, $Val extends Position>
    implements $PositionCopyWith<$Res> {
  _$PositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionImplCopyWith<$Res>
    implements $PositionCopyWith<$Res> {
  factory _$$PositionImplCopyWith(
          _$PositionImpl value, $Res Function(_$PositionImpl) then) =
      __$$PositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$PositionImplCopyWithImpl<$Res>
    extends _$PositionCopyWithImpl<$Res, _$PositionImpl>
    implements _$$PositionImplCopyWith<$Res> {
  __$$PositionImplCopyWithImpl(
      _$PositionImpl _value, $Res Function(_$PositionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$PositionImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionImpl with DiagnosticableTreeMixin implements _Position {
  const _$PositionImpl({required this.latitude, required this.longitude});

  factory _$PositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Position(latitude: $latitude, longitude: $longitude)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Position'))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionImplCopyWith<_$PositionImpl> get copyWith =>
      __$$PositionImplCopyWithImpl<_$PositionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionImplToJson(
      this,
    );
  }
}

abstract class _Position implements Position {
  const factory _Position(
      {required final double latitude,
      required final double longitude}) = _$PositionImpl;

  factory _Position.fromJson(Map<String, dynamic> json) =
      _$PositionImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$PositionImplCopyWith<_$PositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
