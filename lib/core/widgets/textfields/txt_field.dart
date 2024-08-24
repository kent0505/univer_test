import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/app_colors.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.controller,
    this.hintText = '...',
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.textField,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(20),
          // FilteringTextInputFormatter.allow(RegExp("[a-zA-Zа-яА-Я]")),
          // FilteringTextInputFormatter.digitsOnly,
        ],
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: AppColors.white,
          fontFamily: Fonts.medium,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.white.withOpacity(0.5),
            fontFamily: Fonts.medium,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          controller.text = value;
          onChanged();
        },
      ),
    );
  }
}
