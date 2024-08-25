import 'package:flutter/cupertino.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle(this.title, {super.key, this.onMore});

  final String title;
  final void Function()? onMore;

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
        if (onMore != null) ...[
          const Spacer(),
          CupertinoButton(
            onPressed: onMore,
            padding: EdgeInsets.zero,
            minSize: 20,
            child: const TextR(
              'Add more',
              fontSize: 20,
            ),
          ),
          const SizedBox(width: 15),
        ],
      ],
    );
  }
}
