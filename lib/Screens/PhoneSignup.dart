import 'package:flutter/material.dart';
import 'package:food_order_app/Screens/HomePage_Screen.dart';

import 'SignIn_Screen.dart';
import 'SignIn_Screen.dart';

class PhoneSignUp extends StatefulWidget {
  static const routeName = "/phoneLogin";
  const PhoneSignUp({Key? key}) : super(key: key);

  @override
  _PhoneSignUpState createState() => _PhoneSignUpState();
}

class _PhoneSignUpState extends State<PhoneSignUp> {
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(32),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/icons/phonecall.png",
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 36,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.black)),
                  filled: true,
                  fillColor: Colors.black,
                  hintText: "Phone Number"),
              controller: _phoneController,
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.black)),
                  filled: true,
                  fillColor: Colors.black,
                  hintText: "Password"),
              controller: _passController,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                child: Text("Login"),
                textColor: Colors.white,
                padding: EdgeInsets.all(16),
                onPressed: () {
                  //code for sign in
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
/*
Scaffold(
body: Container(
padding: EdgeInsets.all(32),
child: Form(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Center(
child: Text(
"Login",
style: TextStyle(
color: Colors.lightBlue,
fontSize: 36,
fontWeight: FontWeight.w500),
),
),
SizedBox(
height: 16,
),
TextFormField(
decoration: InputDecoration(
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(8)),
borderSide: BorderSide(color: Colors.black)),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(8)),
borderSide: BorderSide(color: Colors.black)),
filled: true,
fillColor: Colors.black,
hintText: "Phone Number"),
controller: _phoneController,
),
SizedBox(
height: 16,
),
TextFormField(
decoration: InputDecoration(
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(8)),
borderSide: BorderSide(color: Colors.black)),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(8)),
borderSide: BorderSide(color: Colors.black)),
filled: true,
fillColor: Colors.black,
hintText: "Password"),
controller: _passController,
),
SizedBox(
height: 16,
),
Container(
width: double.infinity,
child: FlatButton(
child: Text("Login"),
textColor: Colors.white,
padding: EdgeInsets.all(16),
onPressed: () {
//code for sign in
Navigator.push(
context,
MaterialPageRoute(builder: (context) => HomePage()),
);
},
color: Colors.blue,
),
)
],
),
),
));*/
