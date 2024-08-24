import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:univer_test/core/widgets/texts/text_r.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/texts/text_b.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          CustomAppbar(),
          SizedBox(height: 20),
          TextB(
            'Settings',
            fontSize: 32,
            color: AppColors.yellow,
          ),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                _SettingsTile(
                  id: 1,
                  title: 'Terms of use',
                ),
                SizedBox(height: 30),
                _SettingsTile(
                  id: 2,
                  title: 'Privacy Policy',
                ),
                SizedBox(height: 30),
                _SettingsTile(
                  id: 3,
                  title: 'Support page',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: CupertinoButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 50),
            const Spacer(),
            SvgPicture.asset('assets/s$id.svg'),
            const SizedBox(width: 7),
            TextR(title, fontSize: 20),
            const Spacer(),
            const SizedBox(
              width: 50,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
