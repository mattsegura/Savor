import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/consts.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';

class IngredientsListWidget extends StatefulWidget {
  const IngredientsListWidget({
    super.key,
    required this.recipe,
    required this.unit,
    required this.sliderValue,
  });

  final RecipeModel recipe;
  final String? unit;
  final double sliderValue;

  @override
  State<IngredientsListWidget> createState() => _IngredientsListWidgetState();
}

class _IngredientsListWidgetState extends State<IngredientsListWidget> {
  double parseAndConvertFraction(String amount) {
    if (doubleFractionMap.containsKey(amount)) {
      return doubleFractionMap[amount]!;
    }
    try {
      return double.parse(amount);
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingSizes.mdl),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.recipe.ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = widget.recipe.ingredients[index];

                final RegExp regex = RegExp(r'^([\d\s½⅓¼⅔¾⅛⅜⅝⅞./]+)?\s*(.*)$');
                final Match match = regex.firstMatch(ingredient)!;
                final String? amount = match[1]?.trim();
                final String description = match[2]!.trim();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (amount != null)
                          Text(
                              (parseAndConvertFraction(amount) +
                                      widget.sliderValue)
                                  .toStringAsFixed(1),
                              style: AppTextStyles()
                                  .mThick
                                  .copyWith(color: context.primaryColor)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            description,
                            style:
                                AppTextStyles().mRegular.copyWith(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
