import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_ai/core/utils/helper_methods.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';

class MealPlanHiveService {
  final _recipeFromApi = Hive.box('meal_plan_recipe');

  Future<void> addMealPlanRecipe(Map<String, dynamic> item) async {
    await _recipeFromApi.add(item);
  }

  Future<void> removeMealPlanRecipe(dynamic key) async {
    await _recipeFromApi.delete(key);
  }

  List<RecipeModel> getMealPlanRecipes() {
    final data = _recipeFromApi.keys.map((key) {
      final item = _recipeFromApi.get(key);
      return {
        "key": key,
        "host": item["host"],
        "title": item["title"],
        "total_time": item["total_time"],
        "image": item["image"],
        "ingredients": item["ingredients"],
        "instructions": item["instructions"],
        "nutrients": item["nutrients"],
        "servings": item["servings"],
        "addTime": item["addTime"],
      };
    }).toList();
    return data.map((e) => RecipeModel.fromJson(parser(e))).toList();
  }
}
