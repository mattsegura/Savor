import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';

class EditIngredientsListWidget extends StatefulWidget {
  const EditIngredientsListWidget({
    super.key,
    required this.ingredient,
    required this.recipe,
    required this.removeIngredient,
  });

  final RecipeModel recipe;
  final String ingredient;
  final void Function() removeIngredient;

  @override
  State<EditIngredientsListWidget> createState() =>
      _EditIngredientsListWidgetState();
}

class _EditIngredientsListWidgetState extends State<EditIngredientsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
                onTap: widget.removeIngredient,
                child: const Icon(Icons.remove_circle,
                    color: Colors.red, size: 30)),
            const SizedBox(width: PaddingSizes.sm),
            Expanded(
              child: Text(
                widget.ingredient,
                style: AppTextStyles().mRegular.copyWith(fontSize: 18),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
