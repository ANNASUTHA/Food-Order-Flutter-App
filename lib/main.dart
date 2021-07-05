import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_order_app/Screens/HomePage_Screen.dart';
import 'package:food_order_app/Screens/OrderSummary_Screen.dart';
import 'package:food_order_app/Screens/PhoneSignup.dart';
import 'package:food_order_app/Screens/PhoneSignup_Screen.dart';
import 'Data/Constants.dart';
import 'Screens/FoodPage_Screen.dart';
import 'Screens/LogIn_Screen.dart';
import 'Screens/SignIn_Screen.dart';
import 'Screens/SignIn_Screen.dart';
import 'Screens/user_info_screen.dart';

Future<dynamic> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yummy Foods',
        theme: ThemeData(
          primarySwatch: Constants.primary,
          brightness: Brightness.dark,
        ),
        home: SignInScreen(),
        routes: {
          "/login": (context) => LoginScreen(),
          "/signIn": (context) => SignInScreen(),
          "/HomePage": (context) => HomePage(),
          "/OrderSummary": (context) => OrderSummaryPage(),
          "/FoodPage": (context) => FoodPage(),
          "/login": (context) => PhoneSignUp(),
          //"/UserInfo": (context) => UserInfoScreen(user: null,),
          //"/PhoneSignUp": (context) => PhoneSignUpPage(),
          //"/UserInfo": (context) => UserInfoScreen(user: null,),
        });
  }
}
