import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';

class MealPlaneRecipeWidget extends StatelessWidget {
  const MealPlaneRecipeWidget({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: kStandardBorderRadius,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                    image: CachedNetworkImageProvider(recipe.image))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: PaddingSizes.sm, top: PaddingSizes.mdl),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      recipe.title,
                      textAlign: TextAlign.start,
                      style: AppTextStyles()
                          .mThick
                          .copyWith(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Serving ${recipe.servings.toString()}',
                      textAlign: TextAlign.left,
                      style:
                          AppTextStyles().mThick.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: PaddingSizes.xs,
          ),
        ],
      ),
    );
  }
}
