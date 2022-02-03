import 'dart:convert';

import 'package:axe/util/constants.dart';
import 'package:axe/util/global.dart';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart';


class Apiprovider {

  Future<dynamic> getApi(String endUrl) async{
    var token=await Global.getStringValuesSF(Constant.AccessToken);
    final response = await get(Uri.parse(Constant.baseUrl + endUrl),
        headers: {"Accept": "application/json",
          "Authorization": 'Bearer '+token,
        });

    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get data');

    }
  }

}



