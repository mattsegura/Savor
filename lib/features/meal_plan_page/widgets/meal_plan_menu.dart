import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/features/meal_plan_page/providers/meal_plane_page_provider/meal_plan_page_provider.dart';
import 'package:meal_ai/features/meal_plan_page/widgets/add_meal_plan_recipe_widget.dart';
import 'package:meal_ai/features/recipes_page/providers/recipe_from_url_provider/recipe_from_url_provider.dart';
import 'package:pull_down_button/pull_down_button.dart';

class MealPlanMenu extends ConsumerStatefulWidget {
  const MealPlanMenu({super.key, required this.builder, required this.addTime});
  final PullDownMenuButtonBuilder builder;
  final DateTime addTime;

  @override
  ConsumerState<MealPlanMenu> createState() => _MealPlanMenuState();
}

class _MealPlanMenuState extends ConsumerState<MealPlanMenu> {
  @override
  Widget build(BuildContext context) {
    final recipe = ref.watch(recipeFromUrlProvider);
    final mealPlanRecipe = ref.read(mealPlanProvider.notifier);

    return PullDownButton(
        itemBuilder: (context) => [
              PullDownMenuItem(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useRootNavigator: true,
                      builder: (BuildContext context) {
                        return AddMealPlanRecipeWidget(
                            recipe: recipe,
                            mealPlanRecipe: mealPlanRecipe,
                            mounted: mounted,
                            addTime: widget.addTime);
                      });
                },
                title: 'Add Recipe',
                icon: Icons.post_add,
              ),
              PullDownMenuItem(
                title: 'Add Note',
                subtitle: 'Add notes for your meal plans',
                onTap: () {},
                icon: Icons.note_add_outlined,
              ),
              PullDownMenuItem(
                onTap: () {},
                title: 'Add Random Recipe',
                icon: Icons.auto_fix_high_outlined,
              ),
            ],
        position: PullDownMenuPosition.automatic,
        buttonBuilder: widget.builder);
  }
}
