import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meal_ai/features/grocery_list_page/widgets/grocery_list_dialog.dart';
import 'package:meal_ai/features/grocery_list_page/widgets/grocery_list_widget.dart';

class GroceryListPage extends ConsumerStatefulWidget {
  const GroceryListPage({super.key});

  @override
  ConsumerState<GroceryListPage> createState() => _GroceryListPageState();
}

class _GroceryListPageState extends ConsumerState<GroceryListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GroceryListPageBody(),
    );
  }
}

class GroceryListPageBody extends StatefulWidget {
  const GroceryListPageBody({super.key});

  @override
  State<GroceryListPageBody> createState() => _GroceryListPageBodyState();
}

class _GroceryListPageBodyState extends State<GroceryListPageBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingSizes.md, vertical: PaddingSizes.sm),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grocery List',
                    style: AppTextStyles().lThick,
                  ),
                  GroceryListDialog(
                      builder: ((context, showMenu) => IconButton(
                          onPressed: showMenu,
                          icon: const Icon(Icons.more_horiz, size: 30))))
                  // IconButton(
                  //     onPressed: () {
                  //       // showCupertinoDialog(
                  //       //     context: context,
                  //       //     barrierDismissible: true,
                  //       //     builder: (context) {
                  //       //       return const GroceryListSettings();
                  //       //     });
                  //     },
                  //     icon: const Icon(
                  //       Icons.more_horiz,
                  //       size: 30,
                  //     ))
                ],
              ),
              const SizedBox(height: PaddingSizes.mdl),
              const GroceryListWidget()
            ],
          ),
        ),
      ),
    );
  }
}
