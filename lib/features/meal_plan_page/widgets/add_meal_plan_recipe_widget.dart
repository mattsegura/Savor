import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/core/widgets/searchbar_widget.dart';
import 'package:meal_ai/features/meal_plan_page/providers/meal_plane_page_provider/meal_plan_page_provider.dart';
import 'package:meal_ai/features/meal_plan_page/widgets/meal_plan_page.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';

class AddMealPlanRecipeWidget extends StatelessWidget {
  const AddMealPlanRecipeWidget({
    super.key,
    required this.recipe,
    required this.mealPlanRecipe,
    required this.mounted,
    required this.addTime,
  });

  final AsyncValue<List<RecipeModel>> recipe;
  final MealPlan mealPlanRecipe;
  final bool mounted;
  final DateTime addTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.9,
      child: recipe.maybeWhen(
          data: (recipes) {
            if (recipes.isEmpty) {
              return const Center(
                child: SizedBox(
                  child: Column(
                    children: [
                      Expanded(child: SizedBox.shrink()),
                      Text('No Recipes added'),
                      Expanded(child: SizedBox.shrink()),
                    ],
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: PaddingSizes.mdl, vertical: PaddingSizes.mdl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: (() => Navigator.pop(context)),
                        child: const Icon(Icons.close_outlined)),
                    const SizedBox(height: PaddingSizes.md),
                    Text('Recipes',
                        style: AppTextStyles().lThick.copyWith(
                            fontSize: 36, color: context.primaryColor)),
                    const SearchBarWidget(),
                    const SizedBox(height: PaddingSizes.mdl),
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = recipes[index];
                          return InkWell(
                            onTap: () async {
                              await mealPlanRecipe.addMealPlanRecipeToHive(
                                  recipe: recipe, addTime: addTime);
                              if (!mounted) return;
                              Navigator.pop(context);
                            },
                            child: MealPlaneRecipeWidget(recipe: recipe),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          orElse: () => const SizedBox.shrink()),
    );
  }
}
