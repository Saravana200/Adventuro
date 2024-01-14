import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'data.freezed.dart';
part 'data.g.dart';


@freezed
class Test with _$Test {
  const factory Test({
     String? Hello,
  }) = _Test;
  factory Test.fromJson(Map<String, dynamic> json) =>
      _$TestFromJson(json);
}

@freezed
class ChatMsg with _$ChatMsg {
  const factory ChatMsg({
    String? message,
  }) = _ChatMsg;
  factory ChatMsg.fromJson(Map<String, dynamic> json) =>
      _$ChatMsgFromJson(json);
}

@freezed
class Chatreply with _$Chatreply {
  const factory Chatreply({
    required List<String> message,
    required String rating,
    required String best_time,
  }) = _Chatreply;

  factory Chatreply.fromJson(Map<String, dynamic> json) => _$ChatreplyFromJson(json);
}

@freezed
class Places with _$Places {
  const factory Places({
    required List<Place> places,
  }) = _Places;

  factory Places.fromJson(Map<String, dynamic> json) => _$PlacesFromJson(json);
}

@freezed
class Place with _$Place {
  const factory Place({
    required String id,
    required String image_url,
    required Location location,
    required String description,
    required String price
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required String name,
    required String city,
    required String country,
    required Position position,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

@freezed
class Position with _$Position {
  const factory Position({
    required double latitude,
    required double longitude,
  }) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) => _$PositionFromJson(json);
}

