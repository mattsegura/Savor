import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/date_time.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/core/widgets/appbar.dart';
import 'package:meal_ai/features/grocery_list_page/providers/grocery_list_provider/grocery_list_provider.dart';
import 'package:meal_ai/features/meal_plan_page/providers/meal_plane_page_provider/meal_plan_page_provider.dart';
import 'package:meal_ai/features/meal_plan_page/screens/add_meal_plan_list.dart';
import 'package:meal_ai/features/meal_plan_page/widgets/meal_plan_menu.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';

class MealPlanPage extends ConsumerStatefulWidget {
  const MealPlanPage({super.key});

  @override
  ConsumerState<MealPlanPage> createState() => _MealPlanPageState();
}

class _MealPlanPageState extends ConsumerState<MealPlanPage> {
  final List<Map<String, dynamic>> mealRecipeIngredients = [];
  @override
  void didChangeDependencies() {
    final mealRecipes =
        ref.read(mealPlanProvider.notifier).getMealPlanRecipes();

    final today = DateTime.now();
    final currentDate = DateTime(today.year, today.month, today.day);

    for (RecipeModel mealRecipe in mealRecipes) {
      final addTime = DateTime.parse(mealRecipe.addTime);
      final recipeDate = DateTime(addTime.year, addTime.month, addTime.day);

      if (recipeDate.isBefore(currentDate)) {
        ref
            .read(mealPlanProvider.notifier)
            .deleteMealPlanRecipeFromHive(key: mealRecipe.key);
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Meal Plan',
        showTrailingButton: true,
        showLeadingButton: false,
        trailingButtonOnPressed: () {
          mealRecipeIngredients.clear();
          final mealRecipes =
              ref.read(mealPlanProvider.notifier).getMealPlanRecipes();

          for (var mealRecipe in mealRecipes) {
            for (var ingredient in mealRecipe.ingredients) {
              final RegExp regex = RegExp(r'^([\d./\s]+)?(.*)$');
              final Match match = regex.firstMatch(ingredient)!;
              final String? amount = match[1]?.trim();
              final String description = match[2]!.trim();
              mealRecipeIngredients.add({
                "groceryName": description,
                "value": amount,
                "isChecked": false
              });
            }
          }
          showModalBottomSheet(
              isScrollControlled: true,
              useRootNavigator: true,
              backgroundColor: Colors.grey.shade100,
              context: context,
              builder: ((context) {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.95,
                  width: MediaQuery.sizeOf(context).width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: PaddingSizes.mdl,
                        vertical: PaddingSizes.mdl),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Text('Cancel',
                                    style: AppTextStyles()
                                        .lRegular
                                        .copyWith(color: context.primaryColor)),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await ref
                                      .read(groceryListProvider.notifier)
                                      .addMultipleGroceries(
                                          mealRecipeIngredients);

                                  if (!mounted) return;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Successfully added ingredients to groccery list')));
                                  Navigator.pop(context);
                                },
                                child: Text(
                                    'Add ${mealRecipeIngredients.length}',
                                    style: AppTextStyles()
                                        .lRegular
                                        .copyWith(color: context.primaryColor)),
                              ),
                            ],
                          ),
                          const SizedBox(height: PaddingSizes.mdl),
                          Text(
                            'Add to Shopping List',
                            style: AppTextStyles().lRegular.copyWith(
                                color: context.primaryColor,
                                fontSize: 32,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(height: PaddingSizes.md),
                          mealRecipeIngredients.isEmpty
                              ? Center(
                                  child: Text(
                                  'Add Recipes in Meal Plan to see it here',
                                  style: AppTextStyles()
                                      .sRegular
                                      .copyWith(color: Colors.grey),
                                ))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: mealRecipeIngredients.length,
                                  itemBuilder: ((context, index) {
                                    final ingredients =
                                        mealRecipeIngredients[index];
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              ingredients.values.toList()[1] ??
                                                  '-',
                                              style: AppTextStyles()
                                                  .mThick
                                                  .copyWith(
                                                      color:
                                                          context.primaryColor),
                                            ),
                                            const SizedBox(
                                                width: PaddingSizes.sm),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                ingredients.values
                                                    .toList()[0]
                                                    .toString(),
                                                style: AppTextStyles().mRegular,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                      ],
                                    );
                                  }))
                        ],
                      ),
                    ),
                  ),
                );
              }));
        },
        trailingButtonIcon: Icon(
          Icons.local_grocery_store_outlined,
          color: context.primaryColor,
          size: 35,
        ),
      ),
      body: const MealPlanPageBody(),
    );
  }
}

class MealPlanPageBody extends ConsumerStatefulWidget {
  const MealPlanPageBody({super.key});

  @override
  ConsumerState<MealPlanPageBody> createState() => _MealPlanPageBodyState();
}

class _MealPlanPageBodyState extends ConsumerState<MealPlanPageBody> {
  String selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    final mealPlanRecipesProvider = ref.watch(mealPlanProvider);
    return SingleChildScrollView(
        child: Column(children: [
      const Divider(),
      const SizedBox(height: PaddingSizes.mdl),
      MealPlanWidget(mealPlanRecipesProvider: mealPlanRecipesProvider)
    ]));
  }
}

class MealPlanWidget extends StatelessWidget {
  const MealPlanWidget({
    super.key,
    required this.mealPlanRecipesProvider,
  });

  final AsyncValue<List<RecipeModel>> mealPlanRecipesProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (context, index) {
          final now = DateTime.now();
          final currentDate = now.add(Duration(days: index));

          String dayLabel;
          if (index == 0) {
            dayLabel = 'Today';
          } else if (index == 1) {
            dayLabel = 'Tomorrow';
          } else {
            dayLabel = getDayName(currentDate.weekday);
          }

          final month = currentDate.month;
          final day = currentDate.day;
          final isCurrentDay = index == 0;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: PaddingSizes.mdl),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    '$dayLabel, ${getMonthName(month)} $day',
                    style: AppTextStyles().lRegular.copyWith(
                        color:
                            isCurrentDay ? context.primaryColor : Colors.grey),
                  ),
                  trailing: MealPlanMenu(
                    addTime: DateTime.now().add(Duration(days: index)),
                    builder: (context, showMenu) => CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: showMenu,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: context.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: PaddingSizes.mdl),
                    child: mealPlanRecipesProvider.maybeWhen(
                        data: (mealPlanRecipes) {
                          if (mealPlanRecipes.isEmpty) {
                            return Align(
                                alignment: Alignment.centerLeft,
                                child: Text('No Recipes',
                                    style: AppTextStyles()
                                        .mRegular
                                        .copyWith(color: Colors.grey)));
                          }
                          return AddedMealPlanList(
                              currentDate: currentDate,
                              mealPlanRecipes: mealPlanRecipes);
                        },
                        orElse: (() => const SizedBox.shrink())))
              ],
            ),
          );
        });
  }
}
