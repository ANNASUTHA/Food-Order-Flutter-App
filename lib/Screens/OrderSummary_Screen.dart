import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Data/Constants.dart';
import 'HomePage_Screen.dart';

class OrderSummaryPage extends StatefulWidget {
  static const routeName = "/OrderSummary";
  @override
  _OrderSummaryPageState createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Constants.materialAppbar(
              context,
              screenSize,
              "Summary Report Page",
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: screenSize.width * 0.9,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                elevation: 4.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "All Order List",
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
                    OrderSummaryList(),
                    SizedBox(
                      height: 30.0,
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.black54,
                      endIndent: 30.0,
                      indent: 30.0,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.sticky_note_2,
                        color: Constants.AppbarText,
                        size: 20.0,
                      ),
                      label: Text(
                        'Place Order',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Constants.buttonTxt,
                        ),
                      ),
                      onPressed: () {
                        showAlertDialog(context);

                        Fluttertoast.showToast(
                            msg: "Order Placed Successfully...",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      style: ElevatedButton.styleFrom(
                        enableFeedback: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Constants.primary,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure want to place order?"),
      content: Text("Order Placed"),
      actions: [
        okButton,
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  /*Future _showConfirmationMessage(BuildContext context, String message) {
    return showModal(
        configuration: FadeScaleTransitionConfiguration(),
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text(
              "Message",
              style: TextStyle(color: Constants.secondary),
              textAlign: TextAlign.center,
            ),
            content: Text(message),
            actionsPadding: EdgeInsets.symmetric(horizontal: 60.0),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                  enableFeedback: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: Constants.primary,
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                child: const Text(
                  "Yes",
                  style: TextStyle(color: Constants.buttonTxt),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  enableFeedback: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: Constants.primary,
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                child: const Text(
                  "No",
                  style: TextStyle(color: Constants.buttonTxt),
                ),
              ),
            ],
          );
        });
  }*/
}

class OrderSummaryList extends StatefulWidget {
  @override
  _OrderSummaryListState createState() => _OrderSummaryListState();
}

class _OrderSummaryListState extends State<OrderSummaryList> {
  final List<Map<String, dynamic>> dishListData = [
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

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: dishListData.length,
        itemBuilder: (context, item) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 4.0,
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
                    Text(
                      dishListData[item]["dish_name"],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Constants.firebaseOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Text(
                              dishListData[item]["dish_price"],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: ElevatedButton.icon(
                  icon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Constants.AppbarText,
                    size: 22.0,
                  ),
                  label: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Constants.buttonTxt,
                    ),
                  ),
                  onPressed: () {
                    _decrementCounter();
                  },
                  style: ElevatedButton.styleFrom(
                    enableFeedback: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Constants.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
