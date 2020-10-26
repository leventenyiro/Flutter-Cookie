import 'package:http/http.dart' as http;

class Session {
  Map<String, String> headers = {};

  var url = 'http://192.168.0.4:8080/login';

  void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] = 
        (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}