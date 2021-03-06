import 'dart:convert';
import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:http/http.dart';

class ApiProvider {

  static Future<dynamic>  getApi(String endUrl) async{
    var token=await Global.getStringValuesSF(Constant.AccessToken);
    print(token);
    final response = await get(Uri.parse(Constant.baseUrl + endUrl),
        headers: {
          "Accept": "application/json",
          "Authorization": 'Bearer '+token,
        });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      return Future.error(response.body);
    }
  }

  static Future<dynamic>  postApi(String endUrl,var jsonBody) async{
    print(jsonBody);
    print(endUrl);
    var token=await Global.getStringValuesSF(Constant.AccessToken);
    final response = await post(Uri.parse(Constant.baseUrl + endUrl),
        headers: {"Accept": "application/json",
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": 'Bearer '+token,
        },
        body: jsonEncode(jsonBody));
    print(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    }else if (response.statusCode == 404) {
      return Future.error("{\"error\":\"Something went wrong.\"}");
    }else {
      return Future.error(response.body);
    }
  }
}



