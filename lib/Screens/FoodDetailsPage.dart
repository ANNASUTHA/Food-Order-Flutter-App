import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_order_app/Bloc/food_details_cubit.dart';
import 'package:food_order_app/Bloc/food_details_state.dart';
import 'package:food_order_app/Widgets/FoodDetailsWidget.dart';

class FoodDetailsPage extends StatefulWidget {
  const FoodDetailsPage({Key? key}) : super(key: key);

  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  void initState() {
    //context.read<FoodDetailsCubit>().fetchFoodDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: BlocBuilder<FoodDetailsCubit, FoodDetailsState>(
        builder: (context, reportState) => Column(children: <Widget>[
          reportState.isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: screenSize.height * 0.3),
                    Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                    )),
                  ],
                )
              : /*reportState.foodDetailsList.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: screenSize.height * 0.3),
                        Center(
                          child: Text(
                            "No Reports Found",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ],
                    )
                  :*/
              AnimationLimiter(
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: reportState.foodDetailsList.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, item) =>
                              AnimationConfiguration.staggeredList(
                                position: item,
                                duration: const Duration(milliseconds: 400),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: FoodDetailsWidget(
                                      reportState.foodDetailsList[item].dishId,
                                      reportState
                                          .foodDetailsList[item].dishName,
                                      reportState
                                          .foodDetailsList[item].dishPrice,
                                      reportState
                                          .foodDetailsList[item].dishImage,
                                      reportState
                                          .foodDetailsList[item].dishCurrency,
                                      reportState
                                          .foodDetailsList[item].dishCalories,
                                      reportState.foodDetailsList[item]
                                          .dishDescription,
                                      reportState.foodDetailsList[item]
                                          .dishAvailability,
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ),
                ),
        ]),
      ),
    );
  }
}
