import 'package:arte/api/api_points.dart';
import 'package:http/http.dart' as http;


class ApiSign {

    final String api;
    final dynamic data;

  ApiSign(this.api, this.data);

  Future<http.Response> postwithData(){
    return http.post(api,body: data).timeout(Duration(minutes: 2));
  }



  // postwithData(api,data) async{ 
    
  //   return http.post(
  //     api,
  //     body: data,
  //     headers:{
  //       'Accept' : ContentType.accepts,
  //     }
  //   ).timeout(Duration(minutes: 2));

  // }



  // getProfile(api) async{
  //   return await http.get(
  //     api,
  //     headers:{
  //       'Content-Type' : ContentType.json,
  //       'Accept' : ContentType.accepts,
  //       'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMjo4MDAwXC9hcGlcL2FydGVcL3NpZ25JbiIsImlhdCI6MTYxODczNDEzOCwiZXhwIjoxNjE4NzM3NzM4LCJuYmYiOjE2MTg3MzQxMzgsImp0aSI6InlyVlVMQXVidlQ0VDI1c0kiLCJzdWIiOjEsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.QLy_kU4J-3N2R8uufDXEl0_i-vlASoljllfcsiFm9CI'
  //     }
  //   );
  // }


}