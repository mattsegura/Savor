import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/consts.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/core/utils/validators.dart';
import 'package:meal_ai/core/widgets/app_textfield.dart';
import 'package:meal_ai/features/grocery_list_page/models/grocery_model/grocery_model.dart';
import 'package:meal_ai/features/grocery_list_page/providers/grocery_list_provider/grocery_list_provider.dart';
import 'package:meal_ai/features/grocery_list_page/providers/state_providers.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class GroceryListWidget extends StatefulHookConsumerWidget {
  const GroceryListWidget({
    super.key,
  });

  @override
  ConsumerState<GroceryListWidget> createState() => _GroceryListWidgetState();
}

class _GroceryListWidgetState extends ConsumerState<GroceryListWidget> {
  final List<RichTextController> _nameController = [];
  final List<RichTextController> _completeNameController = [];
  final List<bool> _isChecked = [];
  final List<Map<String, dynamic>> groceries = [];
  final List<Map<String, dynamic>> completeGroceries = [];
  final _formKey = GlobalKey<FormState>();
  final List<GlobalKey<GroceryTextFieldState>> _groceryTextFieldKeys = [];

  final FocusNode _focusNode = FocusNode();
  FocusNode? _currentFocusNode;
  final groceryStyle = {
    RegExp(r'\d+\.?\d*\/?\d*|½|⅓|⅔|¼|¾|⅕|⅖|⅗|⅘|⅙|⅚|⅐|⅛|⅜|⅝|⅞|⅑|⅒'):
        const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)
  };

  @override
  void initState() {
    _nameController.clear();
    _completeNameController.clear();
    _isChecked.clear();
    super.initState();
  }

  void updateCompleteGrocery() {
    _completeNameController.clear();
    for (var grocery in ref.read(groceryListProvider)) {
      _groceryTextFieldKeys.add(GlobalKey<GroceryTextFieldState>());

      _completeNameController.add(RichTextController(
          patternMatchMap: groceryStyle,
          text: grocery.groceryName,
          onMatch: (matches) {}));
    }
  }

  void addGroceryItem() {
    _groceryTextFieldKeys.add(GlobalKey<GroceryTextFieldState>());
    return setState(() {
      _currentFocusNode?.unfocus();
      final controller = RichTextController(
        patternMatchMap: groceryStyle,
        onMatch: (matches) {},
      );

      // Add the listener here
      controller.addListener(() {
        if (replaceFractions(controller)) {
          controller.removeListener(listenerFunction);
          controller.addListener(listenerFunction);
        }
      });

      _nameController.add(controller);
      _isChecked.add(false);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
        _currentFocusNode = _focusNode;
      });
    });
  }

  @override
  void dispose() {
    for (var item in _nameController) {
      item.dispose();
    }
    for (var item in _completeNameController) {
      item.dispose();
    }
    _focusNode.unfocus();
    _focusNode.dispose();
    super.dispose();
  }

  bool replaceFractions(RichTextController controller) {
    String newText = controller.text;
    bool replaced = false;
    for (var fraction in fractionMap.keys) {
      if (newText.contains(fraction)) {
        newText = newText.replaceAll(fraction, fractionMap[fraction]!);
        replaced = true;
      }
    }
    if (replaced) {
      // Preserve the cursor position
      int cursorPos = controller.selection.start;
      controller.text = newText;
      if (cursorPos < newText.length) {
        controller.selection = TextSelection.collapsed(offset: cursorPos);
      } else {
        controller.selection =
            TextSelection.fromPosition(TextPosition(offset: newText.length));
      }
    }
    return replaced;
  }

  void listenerFunction() {
    if (_nameController.isNotEmpty) {
      RichTextController controller = _nameController
          .last; // Get the last controller, which is the current one
      if (replaceFractions(controller)) {
        controller.removeListener(
            listenerFunction); // Remove the listener to prevent recursion
        controller
            .addListener(listenerFunction); // Add it back after making changes
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final groceryList = ref.watch(groceryListProvider);
    final groceryMethods = ref.read(groceryListProvider.notifier);
    updateCompleteGrocery();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final hasUpdateGrocery = ref.watch(hasUpdatedGroceryProvider);
              if (_nameController.isEmpty && hasUpdateGrocery == false) {
                return const SizedBox.shrink();
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _nameController.clear();
                          _isChecked.clear();
                          _completeNameController.clear();
                          FocusScope.of(context).unfocus();
                          ref.read(hasUpdatedGroceryProvider.notifier).state =
                              false;
                        });
                      },
                      child: Text('Clear',
                          style: AppTextStyles()
                              .mRegular
                              .copyWith(color: context.primaryColor)),
                    ),
                    TextButton(
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        groceries.clear();
                        completeGroceries.clear();
                        for (var grocery in _nameController) {
                          groceries.add({
                            "groceryName": grocery.text.trim(),
                            "isChecked": false,
                          });
                        }
                        for (int index = 0;
                            index < groceryList.length;
                            index++) {
                          var grocery = groceryList[index];
                          var controller = _completeNameController[index];
                          completeGroceries.add({
                            "groceryName": controller.text.trim(),
                            "isChecked": grocery.isChecked,
                            "key": grocery.key,
                          });
                        }

                        _nameController.clear();
                        _completeNameController.clear();
                        _isChecked.clear();
                        FocusScope.of(context).unfocus();
                        await groceryMethods
                            .updateMultipleGroceries(completeGroceries);
                        await groceryMethods.addMultipleGroceries(groceries);
                        setState(() {
                          ref.read(hasUpdatedGroceryProvider.notifier).state =
                              false;
                        });
                      },
                      child: Text('Done',
                          style: AppTextStyles()
                              .mRegular
                              .copyWith(color: context.primaryColor)),
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: PaddingSizes.md),
          if (groceryList.isEmpty && _nameController.isEmpty) ...[
            GestureDetector(
              onTap: () => addGroceryItem(),
              child: Row(
                children: [
                  const SizedBox(width: PaddingSizes.sm),
                  Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: context.primaryColor, shape: BoxShape.circle),
                      child: const Icon(Icons.add, color: Colors.white)),
                  const SizedBox(width: PaddingSizes.sm),
                  Text('New Item',
                      style: AppTextStyles()
                          .mThick
                          .copyWith(color: context.primaryColor)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.7,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('This list is empty'),
                ],
              ),
            ),
          ],
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: groceryList.length + _nameController.length,
              itemBuilder: (context, index) {
                if (index < groceryList.length) {
                  final grocery = groceryList[index];
                  return Stack(
                    children: [
                      Slidable(
                          closeOnScroll: true,
                          key: ValueKey(grocery.key),
                          endActionPane: ActionPane(
                              extentRatio: 0.3,
                              motion: const StretchMotion(),
                              children: [
                                DeleteGroceryWidget(
                                  groceryMethods: groceryMethods,
                                  grocery: grocery,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.6,
                                    child: Checkbox(
                                        activeColor: Colors.white,
                                        checkColor: context.primaryColor,
                                        focusColor: context.primaryColor,
                                        shape: const CircleBorder(),
                                        side:
                                            MaterialStateBorderSide.resolveWith(
                                          (states) => BorderSide(
                                              width: 1.0,
                                              color: context.primaryColor),
                                        ),
                                        value: grocery.isChecked,
                                        onChanged: (val) {
                                          setState(() {
                                            FocusScope.of(context).unfocus();

                                            final updatedGrocery = grocery
                                                .copyWith(isChecked: val!);
                                            groceryList[index] = updatedGrocery;
                                            groceryMethods.updateGrocery(
                                                groceryName:
                                                    updatedGrocery.groceryName,
                                                isChecked:
                                                    updatedGrocery.isChecked,
                                                key: updatedGrocery.key);
                                          });
                                        }),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.7,
                                    height: 40,
                                    child: AppTextField(
                                      key: ValueKey(grocery.key),
                                      maxLines: 1,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: PaddingSizes.sm,
                                              vertical: 0),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      onChanged: (p0) {
                                        ref
                                            .read(hasUpdatedGroceryProvider
                                                .notifier)
                                            .state = true;
                                      },
                                      onEditingComplete: () {},
                                      controller:
                                          _completeNameController[index],
                                      textStyle: AppTextStyles().mRegular,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                      grocery.isChecked
                          ? Positioned(
                              top: 25,
                              left: 50,
                              child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height: 1,
                                  color: context.primaryColor.withOpacity(0.7)),
                            )
                          : const SizedBox.shrink(),
                    ],
                  );
                } else {
                  int adjustedIndex = index - groceryList.length;
                  final controller = _nameController[adjustedIndex];
                  return Stack(
                    children: [
                      Slidable(
                          key: const ValueKey(0),
                          endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                DeleteGroceryWidget(
                                  groceryMethods: groceryMethods,
                                  grocery: const GroceryModel(
                                      groceryName: '',
                                      isChecked: false,
                                      key: ''),
                                ),
                              ]),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.6,
                                    child: Checkbox(
                                        activeColor: Colors.white,
                                        checkColor: context.primaryColor,
                                        focusColor: context.primaryColor,
                                        shape: const CircleBorder(),
                                        side:
                                            MaterialStateBorderSide.resolveWith(
                                          (states) => BorderSide(
                                              width: 1.0,
                                              color: context.primaryColor),
                                        ),
                                        value: _isChecked[adjustedIndex],
                                        onChanged: (val) {
                                          setState(() {
                                            _isChecked[adjustedIndex] = val!;
                                          });
                                        }),
                                  ),
                                  GroceryTextField(
                                      key: _groceryTextFieldKeys[adjustedIndex],
                                      controller: controller,
                                      adjustedIndex: adjustedIndex,
                                      nameController: _nameController,
                                      focusNode: _focusNode),
                                ],
                              )
                            ],
                          )),
                      _isChecked[adjustedIndex]
                          ? Positioned(
                              top: 25,
                              left: 50,
                              child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height: 1,
                                  color: context.primaryColor.withOpacity(0.7)),
                            )
                          : const SizedBox.shrink(),
                    ],
                  );
                }
              }),
          const SizedBox(height: PaddingSizes.md),
          if (groceryList.isEmpty && _nameController.isEmpty)
            const SizedBox()
          else
            GestureDetector(
              onTap: () => addGroceryItem(),
              child: Row(
                children: [
                  const SizedBox(width: PaddingSizes.sm),
                  Container(
                      height: 30,
                      width: 30,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          color: context.primaryColor, shape: BoxShape.circle),
                      child: const Icon(Icons.add, color: Colors.white)),
                  const SizedBox(width: PaddingSizes.sm),
                  Text('New Item',
                      style: AppTextStyles()
                          .mThick
                          .copyWith(color: context.primaryColor)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class GroceryTextField extends StatefulWidget {
  final RichTextController controller;
  final int adjustedIndex;
  final List<RichTextController> nameController;
  final FocusNode focusNode;

  const GroceryTextField({
    Key? key,
    required this.controller,
    required this.adjustedIndex,
    required this.nameController,
    required this.focusNode,
  }) : super(key: key);

  @override
  GroceryTextFieldState createState() => GroceryTextFieldState();
}

class GroceryTextFieldState extends State<GroceryTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.7,
      height: 40,
      child: AppTextField(
        maxLines: 1,
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: PaddingSizes.sm, vertical: 0),
        onChanged: (p0) {},
        onEditingComplete: () {},
        validator: validateField,
        focusNode: widget.adjustedIndex == widget.nameController.length - 1
            ? widget.focusNode
            : null,
        textStyle: AppTextStyles().mRegular,
      ),
    );
  }
}

class DeleteGroceryWidget extends StatelessWidget {
  const DeleteGroceryWidget({
    super.key,
    required this.groceryMethods,
    required this.grocery,
  });

  final GroceryList groceryMethods;
  final GroceryModel grocery;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      flex: 1,
      onPressed: (context) => groceryMethods.deleteGrocery(key: grocery.key),
      backgroundColor: Colors.redAccent,
      foregroundColor: Colors.white,
      icon: Icons.delete,
    );
  }
}
