import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/features/grocery_list_page/providers/state_providers.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes_page/providers/recipe_from_url_provider/recipe_from_url_provider.dart';
import 'package:meal_ai/features/recipes_page/widgets/edit_recipe_widgets/edit_recipe_menu.dart';
import 'package:meal_ai/features/recipes_page/widgets/ingredient_list_widget.dart';
import 'package:meal_ai/features/recipes_page/widgets/instructions_list_widget.dart';
import 'package:meal_ai/features/recipes_page/widgets/nutrition_list_widget.dart';
import 'package:meal_ai/features/recipes_page/widgets/recipe_image_and_button_widget.dart';
import 'package:meal_ai/features/recipes_page/widgets/recipe_serving_and_time_widget.dart';
import 'package:meal_ai/features/recipes_page/widgets/scale_or_convert/scale_or_convert_dialog.dart';

class RecipeDetailsPage extends ConsumerStatefulWidget {
  const RecipeDetailsPage({super.key, required this.recipe});
  final RecipeModel recipe;

  @override
  ConsumerState<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends ConsumerState<RecipeDetailsPage> {
  String unit = 'us';
  double sliderValue = 0;
  bool showConvertOrScale = false;

  @override
  Widget build(BuildContext context) {
    final convertUnit = ref.watch(convertUnitProvider);
    final recipe = ref.watch(recipeFromUrlProvider);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: context.primaryColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.ios_share, color: context.primaryColor)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.folder_copy_outlined,
                    color: context.primaryColor)),
            EditRecipeMenu(
                unit: unit,
                recipe: widget.recipe,
                builder: ((context, showMenu) => IconButton(
                    onPressed: showMenu,
                    icon: Icon(Icons.more_vert, color: context.primaryColor)))),
          ],
        ),
        body: recipe.maybeWhen(
            data: (data) {
              if (data.isEmpty) {
                return const SizedBox();
              } else {
                final recipeData = data
                    .where((element) => element.key == widget.recipe.key)
                    .first;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RecipeImageAndButton(recipe: widget.recipe),
                      const SizedBox(height: 35),
                      Text(
                        recipeData.title,
                        textAlign: TextAlign.center,
                        style: AppTextStyles().lRegular,
                      ),
                      RecipeServingAndTimeWidget(
                          recipe: recipeData, sliderValue: sliderValue),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: PaddingSizes.md),
                            child: Text('Ingredients',
                                style: AppTextStyles().mThick),
                          ),
                          showConvertOrScale
                              ? TextButton(
                                  onPressed: () {
                                    setState(() {
                                      showConvertOrScale = false;
                                    });
                                  },
                                  child: Text(
                                    'Done',
                                    style: AppTextStyles().mThick,
                                  ))
                              : ScaleOrConvertDialog(
                                  builder: ((context, showMenu) => TextButton(
                                        onPressed: showMenu,
                                        child: Text('Scale or Convert',
                                            style: AppTextStyles().mThick),
                                      )),
                                  showScaleOrConvert: () => setState(() {
                                        showConvertOrScale = true;
                                      })),
                        ],
                      ),
                      if (showConvertOrScale == true) ...[
                        if (convertUnit == 'scale') ...[
                          Slider(
                              value: sliderValue,
                              max: 5,
                              min: -1,
                              onChanged: ((value) {
                                setState(() {
                                  sliderValue = value;
                                });
                              }))
                        ],
                        if (convertUnit == 'convert') ...[
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ListTile(
                                  title: const Text('Metric'),
                                  leading: Radio<String>(
                                    value: 'metric',
                                    groupValue: unit,
                                    onChanged: (String? value) {
                                      setState(() {
                                        unit = value!;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: const Text('US'),
                                  leading: Radio<String>(
                                    value: 'us',
                                    groupValue: unit,
                                    onChanged: (String? value) {
                                      setState(() {
                                        unit = value!;
                                      });
                                    },
                                  ),
                                ),
                              ])
                        ]
                      ],
                      IngredientsListWidget(
                          recipe: recipeData,
                          unit: unit,
                          sliderValue: sliderValue),
                      const SizedBox(height: PaddingSizes.mdl),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: PaddingSizes.mdl),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Instructions',
                              style: AppTextStyles().mThick,
                              textAlign: TextAlign.left),
                        ),
                      ),
                      const SizedBox(height: PaddingSizes.mdl),
                      InstructionsListWidget(recipe: recipeData),
                      const SizedBox(height: PaddingSizes.mdl),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: PaddingSizes.mdl),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Nutrition',
                              style: AppTextStyles().mThick,
                              textAlign: TextAlign.left),
                        ),
                      ),
                      const SizedBox(height: PaddingSizes.mdl),
                      NutritionListWidget(recipe: recipeData),
                    ],
                  ),
                );
              }
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => const SizedBox.shrink()));
  }
}
