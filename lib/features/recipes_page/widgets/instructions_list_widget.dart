import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';

class InstructionsListWidget extends StatefulWidget {
  const InstructionsListWidget({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  State<InstructionsListWidget> createState() => _InstructionsListWidgetState();
}

class _InstructionsListWidgetState extends State<InstructionsListWidget> {
  final List seperatedInstructions = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    seperatedInstructions.clear();
    seperatedInstructions.addAll(widget.recipe.instructions.split('\n'));
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
              itemCount: seperatedInstructions.length,
              itemBuilder: (context, index) {
                final instructions = seperatedInstructions[index];
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          (index + 1).toString(),
                          style: AppTextStyles()
                              .mThick
                              .copyWith(color: context.primaryColor),
                        ),
                        const SizedBox(width: PaddingSizes.sm),
                        Expanded(
                          child: Text(
                            instructions,
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
