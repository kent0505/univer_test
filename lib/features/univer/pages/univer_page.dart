import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_b.dart';

class UniverPage extends StatelessWidget {
  const UniverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          CustomAppbar(),
          SizedBox(height: 20),
          TextB(
            'New university',
            fontSize: 32,
            color: AppColors.yellow,
          ),
        ],
      ),
    );
  }
}
