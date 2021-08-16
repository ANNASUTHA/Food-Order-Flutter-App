import 'package:flutter/material.dart';
import 'package:food_order_app/Screens/HomePage_Screen.dart';

class Constants {
  //APILink
  static const String devLink =
      "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";

  // colors
  static const primary = Colors.blue;
  static final secondary = Colors.blue[800];
  static const buttonTxt = Colors.white;
  static const textLink = Colors.blueAccent;
  static const ErrorText = Colors.red;
  static const AlertText = Colors.redAccent;
  static const AppbarText = Colors.white;
  static const BottomNavbar = Colors.white;
  static const CardColor = Colors.white;
  static const splashColor = Colors.grey;
  static const splashScreenColor = Colors.blue;
  static const firebaseYellow = Colors.yellowAccent;
  static const firebaseNavy = Colors.greenAccent;
  static const firebaseGrey = Colors.grey;
  static const firebaseOrange = Colors.orangeAccent;
  static const firebaseBack = Colors.white;
  static const black = Colors.black;
//URL
  static const DataUrl = "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";
  //Styles
  static const Style = TextStyle(
      color: Constants.AppbarText, fontWeight: FontWeight.bold, fontSize: 25.0);
  static const CardHeadingStyle = TextStyle(
      color: Constants.primary, fontWeight: FontWeight.bold, fontSize: 20.0);
  static const WelcomeHeaderStyle = TextStyle(
      color: Constants.AppbarText, fontSize: 25.0, fontWeight: FontWeight.bold);
  static const CalendarStyle = TextStyle(
      color: Constants.primary, fontSize: 20.0, fontWeight: FontWeight.bold);

  //Linear Gradient
  static LinearGradient get mainGradient {
    return LinearGradient(
      colors: [
        Color.fromRGBO(21, 101, 192, 1),
        Color.fromRGBO(33, 150, 243, 1),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0, 1],
    );
  }

  static Container materialAppbar(
      BuildContext context, Size screenSize, String pageHead) {
    return Container(
      height: screenSize.height * 0.25,
      decoration: BoxDecoration(
        gradient: mainGradient,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 22.0,
                      ),
                      color: Constants.firebaseOrange,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false);
                      }),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    pageHead,
                    style: TextStyle(
                      color: Constants.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
