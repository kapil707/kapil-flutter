import 'dart:convert';
import 'package:http/http.dart' as http;

class AppApiCall {
  api_call(_url, _body) async {
    var uri = Uri.parse(_url);
    var response = await http.post(uri, body: _body);
    //final response = await http.post(uri);
    var body = response.body;
    var json = jsonDecode(body);
    //print(json);
    return json;
  }
}
