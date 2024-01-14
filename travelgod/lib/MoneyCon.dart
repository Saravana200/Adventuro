import 'package:http/http.dart' as http;

class MoneyController {
  // url
  static const String ENDPOINT = "http://api.exchangeratesapi.io/v1/latest";
  // secret key
  static const String API_KEY = "access_key=caf449aa6f4689d8cc63e388e84a8f50";

// get money function used for call api and return value
  static Future<http.Response?> getMoney(url) async {
    try {
      print(url);
//cal api
      final response = await http.get(Uri.parse(url));
// get response
      return response;
    } catch (e) {
// catch er
      print("fetch get err $e");
    }
  }
}
