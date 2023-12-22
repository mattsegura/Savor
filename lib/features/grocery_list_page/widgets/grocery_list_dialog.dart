import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/features/grocery_list_page/providers/grocery_list_provider/grocery_list_provider.dart';
import 'package:pull_down_button/pull_down_button.dart';

class GroceryListDialog extends ConsumerStatefulWidget {
  const GroceryListDialog({
    super.key,
    required this.builder,
  });
  final PullDownMenuButtonBuilder builder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditRecipeMenuState();
}

class _EditRecipeMenuState extends ConsumerState<GroceryListDialog> {
  final List<dynamic> keys = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final groceries = ref.read(groceryListProvider);
    for (var item in groceries) {
      keys.add(item.key);
    }
    return PullDownButton(
        itemBuilder: ((context) => [
              PullDownMenuItem(
                  onTap: () {}, title: 'Share Grocery List', icon: Icons.share),
              PullDownMenuItem(
                  onTap: () async {
                    await ref
                        .read(groceryListProvider.notifier)
                        .deleteAllGrocery(keys: keys);
                  },
                  title: 'Delete All Items',
                  isDestructive: true,
                  icon: Icons.delete),
            ]),
        position: PullDownMenuPosition.automatic,
        buttonBuilder: widget.builder);
  }
}
