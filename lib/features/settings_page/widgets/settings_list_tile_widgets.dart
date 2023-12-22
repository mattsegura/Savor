import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';

class SettingsListTileWidget extends StatefulWidget {
  const SettingsListTileWidget({
    super.key,
    required this.title,
    required this.trailingText,
    required this.paddingSize,
    this.leadingFaIcon,
    this.showArrow = true,
    this.showSwtich = false,
    this.textStyle,
  });
  final String title;

  final FaIcon? leadingFaIcon;
  final String trailingText;
  final double paddingSize;
  final bool showArrow;
  final bool showSwtich;
  final TextStyle? textStyle;

  @override
  State<SettingsListTileWidget> createState() => _SettingsListTileWidgetState();
}

class _SettingsListTileWidgetState extends State<SettingsListTileWidget> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title,
          style: widget.textStyle ?? AppTextStyles().mRegular),
      leading: widget.leadingFaIcon,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.trailingText,
              style: AppTextStyles().mRegular.copyWith(color: Colors.grey)),
          const SizedBox(width: PaddingSizes.xxs),
          widget.showArrow
              ? const Icon(Icons.arrow_forward_ios,
                  size: 18, color: Colors.grey)
              : const SizedBox(),
          widget.showSwtich
              ? CupertinoSwitch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
