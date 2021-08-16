import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:food_order_app/Data/Constants.dart';
import 'package:http/http.dart' as http;
import 'food_details_state.dart';

class FoodDetailsCubit extends Cubit<FoodDetailsState> {
  FoodDetailsCubit()
      : super(FoodDetailsState(isLoading: false, foodDetailsList: []));
  List<FoodDetailsStateList> foodDetailsDataList = [];

  Future<void> fetchFoodDetails() async {
    foodDetailsDataList = [];
    emit(FoodDetailsState(
      isLoading: true,
      foodDetailsList: foodDetailsDataList,
    ));
    final url = Uri.parse(Constants.devLink);

    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Sozu-Id": "01FD589BE56YRBW5PJ5R5NJJN8",
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
      "Host": "www.mocky.io",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept-Language": "en-US,en;q=0.5",
      "Cache-Control": "max-age=0",
      "Connection": "keep-alive",
      "Sec-Fetch-Dest": "document",
      "Sec-Fetch-Mode": "navigate",
      "Sec-Fetch-Site": "none",
      "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0",
    };
    try {
      final response = await http.get(url, headers: headers);
      //print("RESPONSE_________$response");
      final responseData = json.decode(response.body);
      // print("responseDataE_________$responseData");
      responseData.forEach((element) {
        final responseBodyData = responseData["table_menu_list"];
        //print("responseBodyData------------$responseBodyData");
        responseBodyData.forEach((key, value) {
          final responseBodyDataResult = responseBodyData["category_dishes"];
          print("responseBodyDataResult------------$responseBodyDataResult");
          responseBodyDataResult.forEach((key, value) {
            print("element-----value-------$value");
            foodDetailsDataList.add(FoodDetailsStateList(
              dishId: element["dish_id"],
              dishName: element["dish_name"],
              dishPrice: element["dish_price"],
              dishImage: element["dish_image"],
              dishCurrency: element["dish_currency"],
              dishCalories: element["dish_calories"],
              dishDescription: element["dish_description"],
              dishAvailability: element["dish_Availability"],
            ));
          });
        });
      });

      /*responseBodyDataResult.forEach((key, value) {
        print("value------------$value");
        */ /* foodDetailsDataList.add(FoodDetailsStateList(
          dishId: value("dish_id"),
        ));*/ /*
      });*/
      /*responseBodyDataResult.forEach((element) {
        foodDetailsDataList.add(FoodDetailsStateList(
          dishId: element["dish_id"],
          dishName: element["dish_name"],
          dishPrice: element["dish_price"],
          dishImage: element["dish_image"],
          dishCurrency: element["dish_currency"],
          dishCalories: element["dish_calories"],
          dishDescription: element["dish_description"],
          dishAvailability: element["dish_Availability"],
        ));
      });*/
    } catch (error) {
      print("error---------$error");
      throw error;
    }

    emit(FoodDetailsState(
      isLoading: false,
      foodDetailsList: foodDetailsDataList,
    ));
  }
}
