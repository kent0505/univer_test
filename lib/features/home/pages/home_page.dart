import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_b.dart';
import '../widgets/no_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Column(
            children: [
              CustomAppbar(home: true),
              SizedBox(height: 20),
              TextB(
                'Your education',
                fontSize: 32,
                color: AppColors.yellow,
              ),
              Spacer(flex: 2),
              NoData(),
              Spacer(flex: 3),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 77 + getBottom(context)),
              child: PrimaryButton(
                title: 'Add new university',
                onPressed: () {
                  context.push('/add');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
