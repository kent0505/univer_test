import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/app_colors.dart';
import '../utils.dart';
import 'texts/text_r.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.home = false,
    this.edit = false,
  });

  final bool home;
  final bool edit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // color: Colors.greenAccent,
          ),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: getStatusBar(context)),
          Row(
            children: [
              if (home)
                CupertinoButton(
                  onPressed: () {
                    context.push('/settings');
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  minSize: 20,
                  child: const TextR('Settings', fontSize: 16),
                )
              else
                CupertinoButton(
                  onPressed: () {
                    context.pop();
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  minSize: 20,
                  child: const Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_rounded,
                        color: AppColors.white,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      TextR('Back', fontSize: 16),
                    ],
                  ),
                ),
              if (edit) ...[
                const Spacer(),
                CupertinoButton(
                  onPressed: () {},
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  minSize: 20,
                  child: const TextR('Edit', fontSize: 16),
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}
