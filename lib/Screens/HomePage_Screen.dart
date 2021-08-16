import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/Bloc/food_details_cubit.dart';
import 'package:food_order_app/Screens/FoodDetailsPage.dart';
import 'package:food_order_app/Screens/FoodPage_Screen.dart';
import '../Data/Constants.dart';
import '../utils/authentication.dart';
import 'OrderSummary_Screen.dart';
import 'SignIn_Screen.dart';
import 'user_info_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<FoodDetailsCubit>().fetchFoodDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),

              /*DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: AppBar(
                      bottom: TabBar(
                        tabs: [
                          Tab(
                            icon: Icon(Icons.lunch_dining),
                          ),
                          Tab(
                            icon: Icon(Icons.icecream),
                          ),
                          Tab(
                            icon: Icon(Icons.local_pizza),
                          ),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        HomePage(),
                        SecondHomeScreen(),
                        SecondHomeScreen(),
                      ],
                    ),
                  ))*/
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
              /*FoodDetailsPage(),*/
              FoodPage(),
            ],
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
    FirebaseApp firebaseApp = Firebase.initializeApp() as FirebaseApp;

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
              Authentication.signOut(context: context).then((res) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
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
