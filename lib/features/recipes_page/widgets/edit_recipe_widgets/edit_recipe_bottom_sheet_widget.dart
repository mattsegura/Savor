import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/features/recipes_page/models/recipe_model/recipe_model.dart';
import 'package:meal_ai/features/recipes_page/providers/recipe_from_url_provider/recipe_from_url_provider.dart';
import 'package:meal_ai/features/recipes_page/widgets/edit_recipe_widgets/edit_ingredients_list_widget.dart';
import 'package:meal_ai/features/recipes_page/widgets/edit_recipe_widgets/edit_instructions_list_widget.dart';
import 'package:meal_ai/features/recipes_page/widgets/edit_recipe_widgets/edit_recipe_menu.dart';

class EditRecipeBottomSheetWidget extends StatefulWidget {
  const EditRecipeBottomSheetWidget({
    super.key,
    required this.recipeData,
    required TextEditingController titleController,
    required this.extendedIngredientsCopy,
    required this.analyzedInstructionsCopy,
    required this.ref,
    required this.mounted,
    required this.widget,
    required this.modelSetState,
  }) : _titleController = titleController;

  final RecipeModel recipeData;
  final TextEditingController _titleController;
  final List<String> extendedIngredientsCopy;
  final List<String> analyzedInstructionsCopy;
  final WidgetRef ref;
  final bool mounted;
  final EditRecipeMenu widget;
  final void Function(void Function()) modelSetState;

  @override
  State<EditRecipeBottomSheetWidget> createState() =>
      _EditRecipeBottomSheetWidgetState();
}

class _EditRecipeBottomSheetWidgetState
    extends State<EditRecipeBottomSheetWidget> {
  final _ingredientNameController = TextEditingController();
  final _stepController = TextEditingController();

  @override
  void dispose() {
    _ingredientNameController.dispose();
    super.dispose();
  }

  void addIngredient({required String ingredient}) {
    widget.extendedIngredientsCopy.add(ingredient);
    widget.modelSetState(() {});
  }

  void removeIngredient({required int index}) {
    widget.extendedIngredientsCopy.removeAt(index);
    widget.modelSetState(() {});
  }

  void addStep({required String step}) {
    List<String> updatedSteps = List.from(widget.analyzedInstructionsCopy)
      ..add(step);

    widget.analyzedInstructionsCopy.clear();
    widget.analyzedInstructionsCopy.addAll(updatedSteps);

    widget.modelSetState(() {});
  }

  void removeStep({required int index}) {
    widget.analyzedInstructionsCopy.removeAt(index);
    widget.modelSetState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.95,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.all(PaddingSizes.md),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel',
                        style: AppTextStyles()
                            .lRegular
                            .copyWith(color: context.primaryColor)),
                  ),
                  TextButton(
                    onPressed: (() async {
                      final combinedAnalyzedInstructionsCopy = widget
                          .analyzedInstructionsCopy
                          .reduce((value, element) => '$value\n$element');

                      final RecipeModel updatedRecipe = widget.recipeData
                          .copyWith(
                              title: widget._titleController.text.trim(),
                              instructions: combinedAnalyzedInstructionsCopy,
                              ingredients: widget.extendedIngredientsCopy);
                      await widget.ref
                          .read(recipeFromUrlProvider.notifier)
                          .updateRecipe(
                              key: widget.recipeData.key,
                              recipe: updatedRecipe);
                      if (!widget.mounted) return;
                      Navigator.pop(context);
                    }),
                    child: Text(
                      'Save',
                      style: AppTextStyles()
                          .lRegular
                          .copyWith(color: context.primaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: PaddingSizes.sm),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    TextFormField(
                      style: AppTextStyles().mRegular,
                      controller: widget._titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: PaddingSizes.mdl),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(PaddingSizes.md),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Ingredients', style: AppTextStyles().mRegular),
                          IconButton(
                              onPressed: () {
                                addIngredientDialog(context);
                              },
                              icon: Icon(
                                Icons.add_circle,
                                size: 35,
                                color: context.primaryColor,
                              ))
                        ],
                      ),
                    ),
                    Divider(
                      indent: PaddingSizes.sm,
                      color: Colors.grey.shade300,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.extendedIngredientsCopy.length,
                      itemBuilder: (context, index) {
                        final ingredient =
                            widget.extendedIngredientsCopy[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: PaddingSizes.sm,
                              vertical: PaddingSizes.xs),
                          child: EditIngredientsListWidget(
                              recipe: widget.recipeData,
                              ingredient: ingredient,
                              removeIngredient: () =>
                                  removeIngredient(index: index)),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: PaddingSizes.mdl),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(PaddingSizes.md),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Steps', style: AppTextStyles().mRegular),
                          IconButton(
                              onPressed: () {
                                addStepDialog(context);
                              },
                              icon: Icon(
                                Icons.add_circle,
                                size: 35,
                                color: context.primaryColor,
                              ))
                        ],
                      ),
                    ),
                    Divider(
                      indent: PaddingSizes.sm,
                      color: Colors.grey.shade300,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.analyzedInstructionsCopy.length,
                      itemBuilder: (context, index) {
                        final step = widget.analyzedInstructionsCopy[index];

                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: PaddingSizes.sm,
                                vertical: PaddingSizes.xs),
                            child: EditInstructionsListWidget(
                              step: step,
                              recipe: widget.recipeData,
                              removeStep: () => removeStep(index: index),
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> addIngredientDialog(BuildContext context) {
    return showDialog(
        context: context,
        useRootNavigator: true,
        builder: ((context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: CupertinoAlertDialog(
                title: Text(
                  'Add Ingredient',
                  style: AppTextStyles().mThick.copyWith(color: Colors.black54),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      _ingredientNameController.clear();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: AppTextStyles().mThick,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      addIngredient(
                          ingredient: _ingredientNameController.text.trim());
                      _ingredientNameController.clear();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Add',
                      style: AppTextStyles().mThick,
                    ),
                  )
                ],
                content: Column(
                  children: [
                    const SizedBox(height: PaddingSizes.sm),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300)),
                      child: TextFormField(
                          controller: _ingredientNameController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: PaddingSizes.sm),
                            hintText: 'Ingredient name',
                            hintStyle: AppTextStyles().sRegular,
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            )));
  }

  Future<dynamic> addStepDialog(BuildContext context) {
    return showDialog(
        context: context,
        useRootNavigator: true,
        builder: ((context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: CupertinoAlertDialog(
                title: Text(
                  'Add Step',
                  style: AppTextStyles().mThick.copyWith(color: Colors.black54),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      _stepController.clear();

                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: AppTextStyles().mThick,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (!widget.mounted) {
                        return;
                      }
                      addStep(step: _stepController.text.trim());
                      _stepController.clear();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Add',
                      style: AppTextStyles().mThick,
                    ),
                  )
                ],
                content: Column(
                  children: [
                    const SizedBox(height: PaddingSizes.sm),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300)),
                      child: TextFormField(
                          controller: _stepController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: PaddingSizes.sm),
                            hintText: 'Write step..',
                            hintStyle: AppTextStyles().sRegular,
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            )));
  }
}
