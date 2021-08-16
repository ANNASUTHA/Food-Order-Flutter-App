class FoodDetailsState {
  bool isLoading;
  List<FoodDetailsStateList> foodDetailsList;
  FoodDetailsState({required this.isLoading, required this.foodDetailsList});
}

class FoodDetailsStateList {
  String? dishId;
  String? dishName;
  double? dishPrice;
  String? dishImage;
  String? dishCurrency;
  int? dishCalories;
  String? dishDescription;
  bool? dishAvailability;
  FoodDetailsStateList(
      {this.dishId,
      this.dishName,
      this.dishPrice,
      this.dishImage,
      this.dishCurrency,
      this.dishCalories,
      this.dishDescription,
      this.dishAvailability});
}
