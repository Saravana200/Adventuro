// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestImpl _$$TestImplFromJson(Map<String, dynamic> json) => _$TestImpl(
      Hello: json['Hello'] as String?,
    );

Map<String, dynamic> _$$TestImplToJson(_$TestImpl instance) =>
    <String, dynamic>{
      'Hello': instance.Hello,
    };

_$ChatMsgImpl _$$ChatMsgImplFromJson(Map<String, dynamic> json) =>
    _$ChatMsgImpl(
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ChatMsgImplToJson(_$ChatMsgImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

_$ChatreplyImpl _$$ChatreplyImplFromJson(Map<String, dynamic> json) =>
    _$ChatreplyImpl(
      message:
          (json['message'] as List<dynamic>).map((e) => e as String).toList(),
      rating: json['rating'] as String,
      best_time: json['best_time'] as String,
    );

Map<String, dynamic> _$$ChatreplyImplToJson(_$ChatreplyImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'rating': instance.rating,
      'best_time': instance.best_time,
    };

_$PlacesImpl _$$PlacesImplFromJson(Map<String, dynamic> json) => _$PlacesImpl(
      places: (json['places'] as List<dynamic>)
          .map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlacesImplToJson(_$PlacesImpl instance) =>
    <String, dynamic>{
      'places': instance.places,
    };

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
      id: json['id'] as String,
      image_url: json['image_url'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.image_url,
      'location': instance.location,
      'description': instance.description,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      name: json['name'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
      'position': instance.position,
    };

_$PositionImpl _$$PositionImplFromJson(Map<String, dynamic> json) =>
    _$PositionImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$PositionImplToJson(_$PositionImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
