import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/widgets/searchbar_widget.dart';
import 'package:meal_ai/features/recipes_page/widgets/recipe_widget.dart';

class RecipePageBody extends StatelessWidget {
  const RecipePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingSizes.md, vertical: PaddingSizes.sm),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recipes',
                  textAlign: TextAlign.start,
                  style: AppTextStyles().lThick,
                ),
              ),
              const SizedBox(height: PaddingSizes.mdl),
              const SearchBarWidget(showFilter: true),
              Padding(
                padding: const EdgeInsets.only(top: PaddingSizes.xxxs),
                child: Row(
                  children: [
                    Text(
                      'Your Recipes',
                      style: AppTextStyles().mThick,
                    ),
                    const Expanded(child: SizedBox.shrink()),
                    TextButton(
                        onPressed: () {},
                        child:
                            Text('See Cookbook', style: AppTextStyles().mThick))
                  ],
                ),
              ),
              const RecipeWidget(),
              const SizedBox(height: PaddingSizes.sm),
            ],
          ),
        ),
      ),
    );
  }
}
