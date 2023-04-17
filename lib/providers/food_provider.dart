import 'dart:math';
import 'package:flutter/cupertino.dart';

import '../models/food_model.dart';

final List<Food> initialData = List.generate(
    50,
    (index) => Food(
        name: "Food $index",
        duration: "${Random().nextInt(100) + 60} Min to prep your meal"));

class FoodProvider with ChangeNotifier {

  final List<Food> _foods = initialData;
  List<Food> get foods => _foods;

  final List<Food> _myList = [];
  List<Food> get myList => _myList;

  void addToList(Food food) {
    _myList.add(food);
    notifyListeners();
  }

  void removeFromList(Food food) {
    _myList.remove(food);
    notifyListeners();
  }
}
