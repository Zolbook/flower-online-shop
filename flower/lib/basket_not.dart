import 'dart:convert';

import 'package:flower/flower.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Basket with ChangeNotifier {
  final Map<Flower, int> items = {};

 
Future<void> saveItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   
    Map<String, int> itemsToSave = {};
    items.forEach((key, value) {
      itemsToSave[jsonEncode(key.toJson())] = value;
    });
    await prefs.setString('basket_items', jsonEncode(itemsToSave));
    notifyListeners();
  }

  Future<void> loadItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encodedData = prefs.getString('basket_items');
    if (encodedData != null) {
      Map<String, int> decodedData = Map.from(jsonDecode(encodedData));
      items.clear();
      decodedData.forEach((key, value) {
        Flower flower = Flower.fromJson(jsonDecode(key));
        items[flower] = value;
      });
    }
    notifyListeners();
  }
    void updateItem(Flower flower, int newQuantity) {
    if (newQuantity > 0) {
      items[flower] = newQuantity;
    } else {
      items.remove(flower);
    }
    notifyListeners();  
  }
  
  void addItem(Flower flower) {
    if (items.containsKey(flower)) {
      items[flower] = items[flower]! + 1;
    } else {
      items[flower] = 1;
    }
    notifyListeners();
  }

  void removeItem(Flower flower) {
    if (items.containsKey(flower) && items[flower]! > 1) {
      items[flower] = items[flower]! - 1;
    } else {
      items.remove(flower);
    }
    notifyListeners();
  }

  int get totalItems => items.values.fold(0, (previousValue, element) => previousValue + element);
}
