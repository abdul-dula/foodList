import 'dart:math';
import 'package:flutter/cupertino.dart';

import '../models/food_model.dart';


final List<Food> initalData = List.generate(50, (index) => Food(

          name: "Food $index",
          duration: "${Random().nextInt(100)+60} Min to prep your meal"));

class FoodProvider with ChangeNotifier{
  final List<Food> _food = initalData;
  List<Food> get food => _food;

  final List<Food> _myList = [];
  List<Food> get myList => _food;

  void addToList(Food food){
    _myList.add(food);
    notifyListeners();
  }
  void removeFromList(Food food){
    _myList.remove(food);
    notifyListeners();
  }

}