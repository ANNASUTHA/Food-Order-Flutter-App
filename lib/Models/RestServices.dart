import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Data/Constants.dart';
import 'ApiError.dart';
import 'ApiResponse.dart';
import 'package:http/http.dart' as http;

class RestServices {
  Future<ApiResponse> getDishes() async {
    ApiResponse _apiResponse = new ApiResponse();
    Uri url = Uri.parse(Constants.DataUrl);
    try {
      final http.Response response = await http.get(url);

      switch (response.statusCode) {
        case 200:
          Fluttertoast.showToast(
              msg: "Order Placed Successfully...",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
          //_apiResponse.Data = FoodListTile.fromJson(json.decode(response.body));
          break;
        case 401:
          Fluttertoast.showToast(
              msg: "Error....",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
          //_apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
          //msgToast('Server error. Please retry');
          break;
        default:
          break;
      }
    } catch (e) {
      //_apiResponse.ApiError = ApiError(error: "Server error. Please retry");
      throw (e);
    }
    return _apiResponse;
  }
}
