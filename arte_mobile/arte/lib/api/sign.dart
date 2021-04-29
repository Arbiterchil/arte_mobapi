import 'package:arte/api/endpoints.dart';
import 'package:http/http.dart' as http;
class ApiSign {

    final String api;
    final dynamic data;

  ApiSign(this.api, this.data);


  Future<http.Response> postwithData(){
    return http.post(Uri.parse('$api'),body: data,
    headers: {
      "Accepts": ContentType.json
    }).timeout(Duration(minutes: 2));
  }

}