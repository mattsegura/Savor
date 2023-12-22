import 'package:flutter/material.dart';
import 'package:meal_ai/core/styles/sizes.dart';
import 'package:meal_ai/core/styles/text_styles.dart';
import 'package:meal_ai/core/utils/extensions/context.dart';
import 'package:meal_ai/features/settings_page/widgets/settings_list_tile_widgets.dart';

class SettingsAccountPage extends StatelessWidget {
  const SettingsAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: const SafeArea(child: SettingsAccountPageBody()));
  }
}

class SettingsAccountPageBody extends StatefulWidget {
  const SettingsAccountPageBody({super.key});

  @override
  State<SettingsAccountPageBody> createState() =>
      _SettingsAccountPageBodyState();
}

class _SettingsAccountPageBodyState extends State<SettingsAccountPageBody> {
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
                'Account',
                style: AppTextStyles().lThick,
              ),
            ),
            const SizedBox(height: PaddingSizes.sm),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  SettingsListTileWidget(
                      title: 'Create Account or Sign In',
                      paddingSize: 0,
                      trailingText: '',
                      showArrow: false,
                      textStyle: AppTextStyles().mRegular.copyWith(
                          color: context.primaryColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "If you've created a Meal AI account on another device, you can sign in to it here to access your saved recipes",
                style: AppTextStyles().sRegular.copyWith(color: Colors.black45),
              ),
            ),
            const SizedBox(height: PaddingSizes.sm),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  const SettingsListTileWidget(
                      title: 'Name',
                      paddingSize: 0,
                      trailingText: 'Annonymous',
                      showArrow: false),
                  Divider(
                      indent: PaddingSizes.mdl,
                      color: Colors.grey.shade300,
                      height: 0),
                  const SettingsListTileWidget(
                      title: 'Password', paddingSize: 0, trailingText: ''),
                ],
              ),
            ),
            const SizedBox(height: PaddingSizes.xxl),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  const SettingsListTileWidget(
                      title: 'Status',
                      paddingSize: 0,
                      trailingText: 'Active',
                      showArrow: false),
                  Divider(
                      indent: PaddingSizes.mdl,
                      color: Colors.grey.shade300,
                      height: 0),
                  const SettingsListTileWidget(
                      title: 'Features',
                      paddingSize: 0,
                      trailingText: '',
                      showArrow: true),
                  Divider(
                      indent: PaddingSizes.mdl,
                      color: Colors.grey.shade300,
                      height: 0),
                  const SettingsListTileWidget(
                      title: 'Manage Subscription',
                      paddingSize: 0,
                      trailingText: '',
                      showArrow: true),
                ],
              ),
            ),
            const SizedBox(height: PaddingSizes.xxl),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const SettingsListTileWidget(
                title: 'Copy Support ID',
                showArrow: true,
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
