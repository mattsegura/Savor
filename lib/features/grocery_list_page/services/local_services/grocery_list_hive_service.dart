import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ai/features/grocery_list_page/models/grocery_model/grocery_model.dart';

class GroceryListService {
  final _groceryListBox = Hive.box('grocery_list');

  Future<void> addGrocery(Map<String, dynamic> item) async {
    await _groceryListBox.add(item);
  }

  Future<void> addMultipleGroceries(List<Map<String, dynamic>> items) async {
    await _groceryListBox.addAll(items);
  }

  Future<void> removeGrocery(dynamic key) async {
    await _groceryListBox.delete(key);
  }

  Future<void> removeAllGroceries(List<dynamic> keys) async {
    await _groceryListBox.deleteAll(keys);
  }

  Future<void> updateGrocery(Map<String, dynamic> item, dynamic key) async {
    await _groceryListBox.put(key, item);
  }

  List<GroceryModel> getGroceries() {
    final data = _groceryListBox.keys.map((key) {
      final item = _groceryListBox.get(key);
      return {
        "key": key,
        "isChecked": item["isChecked"],
        "groceryName": item["groceryName"],
      };
    }).toList();

    return data.map((e) => GroceryModel.fromJson(e)).toList();
  }
}
