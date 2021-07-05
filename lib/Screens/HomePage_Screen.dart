import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/Widgets/listTile_Widget.dart';

import '../Data/Constants.dart';
import '../utils/authentication.dart';
import 'FoodPage_Screen.dart';
import 'LogIn_Screen.dart';
import 'OrderSummary_Screen.dart';
import 'SignIn_Screen.dart';
import 'user_info_screen.dart';
import 'user_info_screen.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/HomePage";
  /*const HomePage({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;*/

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_cart_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => OrderSummaryPage(),
                    ),
                  );
                });
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(5.0),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5.0,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Add Your Fav Dish",
                  style: TextStyle(
                    color: Constants.secondary,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: Colors.black54,
                  endIndent: 30.0,
                  indent: 30.0,
                ),
                FoodPage(),
              ],
            ),
          ),
        ),
        drawer: NavigateDrawer());
  }
}

class NavigateDrawer extends StatefulWidget {
  @override
  _NavigateDrawerState createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  @override
  Widget build(BuildContext context) {
    //FirebaseApp firebaseApp = Firebase.initializeApp() as FirebaseApp;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Center(
            child: UserAccountsDrawerHeader(
              accountEmail:
                  Text("Annasutha", style: TextStyle(color: Colors.black)),
              accountName: Text('annasutha@gmail.com',
                  style: TextStyle(color: Colors.black)),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.home, color: Colors.white),
              onPressed: () => null,
            ),
            title: Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.supervised_user_circle_outlined,
                  color: Colors.white),
              onPressed: () => null,
            ),
            title: Text('User Profile', style: TextStyle(color: Colors.white)),
            onTap: () {
              User? user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => UserInfoScreen(
                      user: user,
                    ),
                  ),
                );
              }
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.add_shopping_cart_rounded,
                  color: Colors.white),
              onPressed: () => null,
            ),
            title: Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () async {
              print("Logout Successfully");
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                    (Route<dynamic> route) => false);
              });
            },
          ),
        ],
      ),
    );
  }
}

class SettingsRoute extends StatelessWidget {
  const SettingsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
    );
  }
}
