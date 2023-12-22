import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/features/settings_page/widgets/settings_list_tile_widgets.dart';

class SettingsGeneralPage extends StatelessWidget {
  const SettingsGeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: const SafeArea(child: SettingsGeneralPageBody()));
  }
}

class SettingsGeneralPageBody extends StatefulWidget {
  const SettingsGeneralPageBody({super.key});

  @override
  State<SettingsGeneralPageBody> createState() =>
      _SettingsGeneralPageBodyState();
}

class _SettingsGeneralPageBodyState extends State<SettingsGeneralPageBody> {
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
                'General',
                style: AppTextStyles().lThick,
              ),
            ),
            const SizedBox(height: PaddingSizes.sm),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  const SettingsListTileWidget(
                      title: 'Theme',
                      paddingSize: 0,
                      trailingText: 'System',
                      showArrow: false),
                  Divider(
                      indent: PaddingSizes.mdl,
                      color: Colors.grey.shade300,
                      height: 0),
                  const SettingsListTileWidget(
                      title: 'App Icon', paddingSize: 0, trailingText: ''),
                ],
              ),
            ),
            const SizedBox(height: PaddingSizes.xxl),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Column(
                children: [
                  SettingsListTileWidget(
                      title: 'Units',
                      paddingSize: 0,
                      trailingText: 'Imperial',
                      showArrow: false),
                ],
              ),
            ),
            const SizedBox(height: PaddingSizes.xxl),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const SettingsListTileWidget(
                title: 'Notifications',
                showSwtich: true,
                showArrow: false,
                trailingText: '',
                paddingSize: PaddingSizes.xl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
