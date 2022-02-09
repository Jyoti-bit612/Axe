
import 'dart:convert';

import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:http/http.dart';

class Apiprovider {
  static Future<dynamic>  getApi(String endUrl) async{
    var token=await Global.getStringValuesSF(Constant.AccessToken);
    final response = await get(Uri.parse(Constant.baseUrl + endUrl),
        headers: {"Accept": "application/json",

          "Authorization": 'Bearer '+token,
        });

    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      return Future.error(response);
    }
  }

  static Future<dynamic>  postApi(String endUrl,var jsonBody) async{
    var token=await Global.getStringValuesSF(Constant.AccessToken);
    final response = await post(Uri.parse(Constant.baseUrl + endUrl),
        headers: {"Accept": "application/json",
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": 'Bearer '+token,
        },
        body: jsonEncode(jsonBody));

    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      return Future.error(response);

    }
  }


}



