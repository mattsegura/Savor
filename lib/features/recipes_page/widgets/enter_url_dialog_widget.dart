import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/utils/validators.dart';
import 'package:meal_ai/features/recipes_page/providers/recipe_from_url_provider/recipe_from_url_provider.dart';

class EnterUrlDialogWidget extends ConsumerStatefulWidget {
  const EnterUrlDialogWidget({
    super.key,
  });

  @override
  ConsumerState<EnterUrlDialogWidget> createState() =>
      _EnterUrlDialogWidgetState();
}

class _EnterUrlDialogWidgetState extends ConsumerState<EnterUrlDialogWidget> {
  final _urlController = TextEditingController();
  bool _isFetchingRecipe = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Form(
        key: _formKey,
        child: CupertinoAlertDialog(
          title: const Text('Add Recipe From Url'),
          content: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Past a URL below and we'll add it to your Recipes"),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoTextFormFieldRow(
                    padding: const EdgeInsets.only(top: PaddingSizes.mdl),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    controller: _urlController,
                    validator: validateField,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CupertinoDialogAction(
                    onPressed: () {
                      _isFetchingRecipe ? null : Navigator.pop(context);
                      _urlController.clear();
                    },
                    isDefaultAction: true,
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ),
                if (_isFetchingRecipe)
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(),
                        Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  )
                else
                  Expanded(
                      child: CupertinoDialogAction(
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) return;
                            setState(() {
                              _isFetchingRecipe = true;
                            });
                            final recipe = await ref
                                .read(recipeFromUrlProvider.notifier)
                                .getRecipeFromUrl(
                                    url: _urlController.text.trim());
                            await ref
                                .read(recipeFromUrlProvider.notifier)
                                .addRecipeFromUrlToHive(recipe: recipe);
                            setState(() {
                              _isFetchingRecipe = false;
                            });
                            _urlController.clear();
                            if (!mounted) return;
                            Navigator.pop(context);
                          },
                          isDefaultAction: true,
                          child: const Text('Fetch'))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
