import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';

class SettingsHowToAddRecipePage extends StatelessWidget {
  const SettingsHowToAddRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SettingsHowToAddRecipePageBody()),
    );
  }
}

class SettingsHowToAddRecipePageBody extends StatefulWidget {
  const SettingsHowToAddRecipePageBody({super.key});

  @override
  State<SettingsHowToAddRecipePageBody> createState() =>
      _SettingsHowToAddRecipePageBodyState();
}

class _SettingsHowToAddRecipePageBodyState
    extends State<SettingsHowToAddRecipePageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingSizes.mdl, vertical: PaddingSizes.mdl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: context.primaryColor),
                    Text(
                      'Settings',
                      style: AppTextStyles()
                          .mThick
                          .copyWith(color: context.primaryColor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: PaddingSizes.mdl),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '1. Search for a Recipe',
                style: AppTextStyles().mThick,
              ),
            ),
            const SizedBox(height: PaddingSizes.mdl),
            Image.asset('images/search_recipe_image.png'),
            const SizedBox(height: PaddingSizes.mdl),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '2. Pick up a recipe',
                style: AppTextStyles().mThick,
              ),
            ),
            const SizedBox(height: PaddingSizes.mdl),
            Image.asset('images/pick_recipe_image.png'),
            const SizedBox(height: PaddingSizes.mdl),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '3. Copy the URL of the recipe',
                style: AppTextStyles().mThick,
              ),
            ),
            const SizedBox(height: PaddingSizes.mdl),
            Image.asset('images/copy_url_image.png'),
            const SizedBox(height: PaddingSizes.mdl),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '4. In the Recipes Page, Tap the + Icon',
                style: AppTextStyles().mThick,
              ),
            ),
            const SizedBox(height: PaddingSizes.mdl),
            Image.asset('images/plus_icon_image.png'),
            const SizedBox(height: PaddingSizes.mdl),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '5. Enter the URL in the form & tap Fetch',
                style: AppTextStyles().mThick,
              ),
            ),
            const SizedBox(height: PaddingSizes.mdl),
            Image.asset('images/url_form_image.png'),
            const SizedBox(height: PaddingSizes.mdl),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '6. Enjoy the Recipe',
                style: AppTextStyles().mThick,
              ),
            ),
            const SizedBox(height: PaddingSizes.mdl),
            Image.asset('images/enjoy_recipe_image.png'),
          ],
        ),
      ),
    );
  }
}
