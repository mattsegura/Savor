import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';

class RecipeServingAndTimeWidget extends StatelessWidget {
  const RecipeServingAndTimeWidget({
    super.key,
    required this.recipe,
    required this.sliderValue,
  });

  final RecipeModel recipe;
  final double sliderValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: PaddingSizes.xxxl, vertical: PaddingSizes.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text('Servings'),
              Text(
                  (int.parse(recipe.servings.split(' ').first) +
                          sliderValue.round())
                      .toStringAsFixed(0),
                  style: AppTextStyles().mThick)
            ],
          ),
          Column(
            children: [
              const Text('Time'),
              Text('${recipe.total_time}m', style: AppTextStyles().mThick)
            ],
          ),
        ],
      ),
    );
  }
}
