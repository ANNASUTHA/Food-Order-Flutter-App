import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order_app/Data/Constants.dart';

class FoodDetailsWidget extends StatefulWidget {
  String? dishId;
  String? dishName;
  double? dishPrice;
  String? dishImage;
  String? dishCurrency;
  int? dishCalories;
  String? dishDescription;
  bool? dishAvailability;
  FoodDetailsWidget(
      this.dishId,
      this.dishName,
      this.dishPrice,
      this.dishImage,
      this.dishCurrency,
      this.dishCalories,
      this.dishDescription,
      this.dishAvailability);

  @override
  _FoodDetailsWidgetState createState() => _FoodDetailsWidgetState();
}

class _FoodDetailsWidgetState extends State<FoodDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    int _counter = 0;
    void _incrementCounter() {
      setState(() {
        _counter++;
      });
    }

    return Container(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4.0,
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Text(
                  ""), /*Icon(
                widget.dishAvailability == "true"
                    ? FontAwesomeIcons.toggleOn
                    : FontAwesomeIcons.powerOff,
                size: 50.0,
                color: Colors.white,
              ),*/
            ),
            title: Text(
              "Employee ID : ${widget.dishId}",
              style: TextStyle(
                  color: Constants.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${widget.dishName.toString()}",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  " ${widget.dishPrice.toString()}",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${widget.dishCalories.toString()}",
                  //textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${widget.dishDescription.toString()}",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "${widget.dishCurrency.toString()}",
                  style: TextStyle(fontSize: 15.0),
                ),
                Image(image: AssetImage("${widget.dishImage.toString()}"))
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
          )),
    );
  }
}
