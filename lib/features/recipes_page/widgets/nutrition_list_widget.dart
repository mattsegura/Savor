import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';

class NutritionListWidget extends StatelessWidget {
  final Map<String, String?> nutrientsMap;

  NutritionListWidget({
    Key? key,
    required RecipeModel recipe,
  })  : nutrientsMap = {
          'Calories': recipe.nutrients.calories,
          'Carbohydrate': recipe.nutrients.carbohydrateContent,
          'Protein': recipe.nutrients.proteinContent,
          'Fat': recipe.nutrients.fatContent,
          'Saturated Fat': recipe.nutrients.saturatedFatContent,
          'Sodium': recipe.nutrients.sodiumContent,
          'Fiber': recipe.nutrients.fiberContent,
          'Sugar': recipe.nutrients.sugarContent,
          'Serving Size': recipe.nutrients.servingSize,
        },
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingSizes.mdl),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: nutrientsMap.keys.length,
          itemBuilder: (context, index) {
            final nutrient = nutrientsMap.keys.elementAt(index);
            final nutrientValue = nutrientsMap[nutrient];

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nutrient,
                      style: AppTextStyles().mRegular.copyWith(fontSize: 20),
                    ),
                    Text(
                      nutrientValue ?? '--',
                      style: AppTextStyles()
                          .mThick
                          .copyWith(color: context.primaryColor, fontSize: 18),
                    ),
                  ],
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
