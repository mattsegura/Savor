import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/features/meal_plan_page/providers/meal_plane_page_provider/meal_plan_page_provider.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';

class AddedMealPlanList extends ConsumerStatefulWidget {
  const AddedMealPlanList({
    super.key,
    required this.currentDate,
    required this.mealPlanRecipes,
  });

  final DateTime currentDate;
  final List<RecipeModel> mealPlanRecipes;

  @override
  ConsumerState<AddedMealPlanList> createState() => _AddedMealPlanListState();
}

class _AddedMealPlanListState extends ConsumerState<AddedMealPlanList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.mealPlanRecipes.length,
        itemBuilder: (context, index) {
          final mealPlanRecipe = widget.mealPlanRecipes[index];
          final addtime = DateTime.parse(mealPlanRecipe.addTime);

          if (addtime.year == widget.currentDate.year &&
              addtime.month == widget.currentDate.month &&
              addtime.day == widget.currentDate.day) {
            return CupertinoContextMenu(
              actions: [
                Builder(
                  builder: (cupertinoContext) => CupertinoContextMenuAction(
                      child: const Text('Delete'),
                      onPressed: () async {
                        await ref
                            .read(mealPlanProvider.notifier)
                            .deleteMealPlanRecipeFromHive(
                                key: mealPlanRecipe.key);
                        if (!mounted) return;
                        Navigator.pop(cupertinoContext);
                      }),
                ),
                Builder(builder: (cupertinoContext) {
                  return CupertinoContextMenuAction(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(cupertinoContext);
                    },
                  );
                })
              ],
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: PaddingSizes.xs),
                child: Container(
                  height: 160,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: kStandardBorderRadius,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3), BlendMode.darken),
                          image: CachedNetworkImageProvider(
                              mealPlanRecipe.image))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: PaddingSizes.sm, top: PaddingSizes.mdl),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            mealPlanRecipe.title,
                            textAlign: TextAlign.start,
                            style: AppTextStyles()
                                .mThick
                                .copyWith(color: Colors.white, fontSize: 24),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Serving ${mealPlanRecipe.servings.toString()}',
                            textAlign: TextAlign.left,
                            style: AppTextStyles()
                                .mThick
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
