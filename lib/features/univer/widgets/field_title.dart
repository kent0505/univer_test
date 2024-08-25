import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        TextR(
          title,
          fontSize: 20,
          color: AppColors.text2,
        ),
      ],
    );
  }
}
