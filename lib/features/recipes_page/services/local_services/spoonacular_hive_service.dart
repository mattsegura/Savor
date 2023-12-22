import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ai/core/utils/helper_methods.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';

class SpoonacularHiveService {
  final _recipeFromApi = Hive.box('recipe_from_url');

  Future<void> addRecipe(Map<String, dynamic> item) async {
    await _recipeFromApi.add(item);
  }

  Future<void> removeRecipe(dynamic key) async {
    await _recipeFromApi.delete(key);
  }

  Future<void> updateRecipe(dynamic key, Map<String, dynamic> recipe) async {
    await _recipeFromApi.put(key, recipe);
  }

  List<RecipeModel> getRecipes() {
    final data = _recipeFromApi.keys.map((key) {
      final item = _recipeFromApi.get(key);
      item['key'] = key;
      return item;
    }).toList();
    return data.map((e) => RecipeModel.fromJson(parser(e))).toList();
  }
}
