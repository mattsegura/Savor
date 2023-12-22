import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';

class EditInstructionsListWidget extends StatefulWidget {
  const EditInstructionsListWidget({
    super.key,
    required this.step,
    required this.recipe,
    required this.removeStep,
  });

  final RecipeModel recipe;
  final String step;
  final void Function() removeStep;

  @override
  State<EditInstructionsListWidget> createState() =>
      _EditInstructionsListWidgetState();
}

class _EditInstructionsListWidgetState
    extends State<EditInstructionsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
                onTap: widget.removeStep,
                child: const Icon(Icons.remove_circle,
                    color: Colors.red, size: 30)),
            const SizedBox(width: PaddingSizes.sm),
            Expanded(
              child: Text(
                widget.step,
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
