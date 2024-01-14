import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:money_converter/Currency.dart';

import 'MoneyCon.dart';


class MoneyConvert {
  static const MethodChannel _channel = const MethodChannel('moneyconvert');

  static Future<double?> convert(Currency from, Currency to) async {
    try {
      if (from.type.isEmpty || to.type.isEmpty) {
        print("type or ammount is missing");
        return null;
      }
      // print(from.type);
      if (from.amount == null) {
        from.amount = 1.0;
      }
      String url =
          "${MoneyController.ENDPOINT}?${MoneyController.API_KEY}";
      //
      Response resp = (await MoneyController.getMoney(url))!;
      final ss = jsonDecode(resp.body);
      double x = ss['rates'][from.type.toString()];
      double y = ss['rates'][to.type.toString()];

      double value= (1/y)*x;
      return value;
    } catch (err) {
      print("convert err $err");
      return 0.0;
    }
  }
}
