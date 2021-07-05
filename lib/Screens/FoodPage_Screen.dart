import 'package:flutter/material.dart';
import 'package:food_order_app/Models/DishList.dart';
import 'package:flutter/cupertino.dart';

import '../Data/Constants.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final List<Map<String, dynamic>> dishedList = [
    {
      "dish_id": "2",
      "dish_name": "Briyani",
      "dish_price": "7.95 INR",
      "dish_type": "1",
      "dish_Availability": "InStock",
      "dish_rest_id": "104",
    },
    {
      "dish_id": "1",
      "dish_name": "Rice ",
      "dish_price": "7.95 INR",
      "dish_type": "0",
      "dish_Availability": "Out of Stock",
      "dish_rest_id": "4",
    },
    {
      "dish_id": "10",
      "dish_name": "Curd",
      "dish_price": "7 INR",
      "dish_type": "2",
      "dish_Availability": "Out of Stock",
      "dish_rest_id": "80",
    },
    {
      "dish_id": "11",
      "dish_name": "Salad",
      "dish_price": "7.05  INR",
      "dish_type": "2",
      "dish_Availability": "InStock",
      "dish_rest_id": "104",
    },
    {
      "dish_id": "2",
      "dish_name": "Briyani",
      "dish_price": "7.95 INR",
      "dish_type": "1",
      "dish_Availability": "InStock",
      "dish_rest_id": "104",
    },
    {
      "dish_id": "1",
      "dish_name": "Rice ",
      "dish_price": "7.95 INR",
      "dish_type": "0",
      "dish_Availability": "Out of Stock",
      "dish_rest_id": "4",
    },
    {
      "dish_id": "10",
      "dish_name": "Curd",
      "dish_price": "7 INR",
      "dish_type": "2",
      "dish_Availability": "Out of Stock",
      "dish_rest_id": "80",
    },
    {
      "dish_id": "11",
      "dish_name": "Salad",
      "dish_price": "7.05  INR",
      "dish_type": "2",
      "dish_Availability": "InStock",
      "dish_rest_id": "104",
    },
  ];
  int _counter = 0;
  int _dishRate = 7;
  void _multiplyDish() {
    setState(() {
      _dishRate = (7 * 2);
      //_dishRate * 2;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    /*final DishList args =
        ModalRoute.of(context)!.settings.arguments as DishList;*/
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: dishedList.length,
      itemBuilder: (context, item) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 9.0,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 5.0,
                      ),
                      /*Text(
                            dishedList[item]["dish_id"],
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Constants.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),*/
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        dishedList[item]["dish_name"],
                        style: TextStyle(
                          color: Constants.firebaseOrange,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        dishedList[item]["dish_price"],
                        style: TextStyle(
                          color: Constants.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      /*Text(
                        dishedList[item]["dish_type"],
                        style: TextStyle(
                          color: Constants.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),*/
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        dishedList[item]["dish_Availability"],
                        style: TextStyle(
                          color: Constants.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: ElevatedButton.icon(
                    icon: Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Constants.AppbarText,
                      size: 30.0,
                    ),
                    label: Text(
                      '      $_counter',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Constants.buttonTxt,
                      ),
                    ),
                    onPressed: () async {
                      _incrementCounter();
                    },
                    style: ElevatedButton.styleFrom(
                      enableFeedback: false,
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      primary: Constants.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

/*class CatalogList extends StatelessWidget {
  final DishList dishList;

  CatalogList({Key? key, required this.dishList});
  @override
  Widget build(BuildContext context) {
    return (dishList == null)
        ? Text("Nothing to show")
        : ListView.builder(
            shrinkWrap: true,
            itemCount: dishList.length,
            itemBuilder: (context, index) {
              return Container();
            },
          );
  }
}*/
