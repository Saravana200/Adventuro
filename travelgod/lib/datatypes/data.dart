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

class flo