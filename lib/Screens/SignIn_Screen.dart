import 'package:flutter/material.dart';
import 'package:food_order_app/Data/Constants.dart';
import 'package:food_order_app/Widgets/google_sign_in_button.dart';
import 'package:food_order_app/utils/authentication.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = "/signIn";
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.firebaseBack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/icons/fire.png',
                        height: 140,
                      ),
                    ),
                    SizedBox(height: 20),
                    /*Text(
                      'FlutterFire',
                      style: TextStyle(
                        color: Constants.black,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Authentication',
                      style: TextStyle(
                        color: Constants.black,
                        fontSize: 30,
                      ),
                    ),*/
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Constants.firebaseOrange,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
