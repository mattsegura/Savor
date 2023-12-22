import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/core/utils/helper_methods.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes_page/providers/recipe_from_url_provider/recipe_from_url_provider.dart';
import 'package:meal_ai/features/recipes_page/widgets/edit_recipe_widgets/edit_recipe_bottom_sheet_widget.dart';
import 'package:pull_down_button/pull_down_button.dart';

class EditRecipeMenu extends ConsumerStatefulWidget {
  const EditRecipeMenu(
      {super.key,
      required this.builder,
      required this.recipe,
      required this.unit});
  final PullDownMenuButtonBuilder builder;
  final RecipeModel recipe;
  final String unit;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditRecipeMenuState();
}

class _EditRecipeMenuState extends ConsumerState<EditRecipeMenu> {
  final _titleController = TextEditingController();
  final _ingredientNameController = TextEditingController();
  final List seperatedInstructions = [];

  @override
  void initState() {
    super.initState();

    _titleController.text = widget.recipe.title;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _ingredientNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recipe = ref.watch(recipeFromUrlProvider);
    return recipe.maybeWhen(
      orElse: () => const SizedBox(),
      loading: () => const CircularProgressIndicator(),
      data: (data) {
        if (data.isEmpty) {
          return const SizedBox();
        } else {
          seperatedInstructions.clear();
          final recipeData =
              data.where((element) => element.key == widget.recipe.key).first;
          seperatedInstructions.addAll(recipeData.instructions.split('\n'));

          return PullDownButton(
              itemBuilder: ((context) => [
                    PullDownMenuItem(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.grey.shade100,
                              isScrollControlled: true,
                              useRootNavigator: true,
                              context: context,
                              builder: ((context) {
                                List<String> extendedIngredientsCopy =
                                    List.from(recipeData.ingredients);
                                List<String> analyzedInstructionsCopy =
                                    List.from(seperatedInstructions);
                                return StatefulBuilder(
                                    builder: (context, modelSetState) {
                                  return EditRecipeBottomSheetWidget(
                                      modelSetState: modelSetState,
                                      recipeData: recipeData,
                                      titleController: _titleController,
                                      analyzedInstructionsCopy:
                                          analyzedInstructionsCopy,
                                      extendedIngredientsCopy:
                                          extendedIngredientsCopy,
                                      ref: ref,
                                      mounted: mounted,
                                      widget: widget);
                                });
                              }));
                        },
                        title: 'Edit',
                        icon: CupertinoIcons.pen),
                    PullDownMenuItem(
                        onTap: () {
                          launchHelperMethod(Uri.parse(widget.recipe.host));
                        },
                        title: 'Visit Source',
                        icon: CupertinoIcons.link),
                    PullDownMenuItem(
                        onTap: () {
                          launchHelperMethod(Uri.parse(
                              'mailto:smith@example.org?subject=News&body=New%20plugin'));
                        },
                        title: 'Report a Problem',
                        icon: CupertinoIcons.exclamationmark_circle),
                    PullDownMenuItem(
                        onTap: () async {
                          await ref
                              .read(recipeFromUrlProvider.notifier)
                              .deleteRecipeFromHive(key: widget.recipe.key);
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Recipe deleted successfully')));
                          Navigator.pop(context);
                        },
                        title: 'Delete',
                        isDestructive: true,
                        icon: CupertinoIcons.delete),
                  ]),
              position: PullDownMenuPosition.automatic,
              buttonBuilder: widget.builder);
        }
      },
    );
  }
}
