import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_ai/features/grocery_list_page/providers/state_providers.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ScaleOrConvertDialog extends ConsumerStatefulWidget {
  const ScaleOrConvertDialog({
    super.key,
    required this.builder,
    required this.showScaleOrConvert,
  });
  final void Function() showScaleOrConvert;
  final PullDownMenuButtonBuilder builder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditRecipeMenuState();
}

class _EditRecipeMenuState extends ConsumerState<ScaleOrConvertDialog> {
  @override
  Widget build(BuildContext context) {
    return PullDownButton(
        itemBuilder: ((context) => [
              PullDownMenuItem(
                  onTap: () {
                    ref.read(convertUnitProvider.notifier).state = 'convert';
                    widget.showScaleOrConvert();
                  },
                  title: 'Convert Units',
                  icon: FontAwesomeIcons.penToSquare),
              PullDownMenuItem(
                  onTap: () async {
                    ref.read(convertUnitProvider.notifier).state = 'scale';
                    widget.showScaleOrConvert();
                  },
                  title: 'Scale Recipes',
                  icon: CupertinoIcons.slider_horizontal_3),
            ]),
        position: PullDownMenuPosition.automatic,
        buttonBuilder: widget.builder);
  }
}
