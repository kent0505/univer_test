import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_b.dart';
import '../widgets/field_title.dart';

class AddProsPage extends StatefulWidget {
  const AddProsPage({
    super.key,
    required this.name,
    required this.location,
    required this.description,
    required this.rate,
  });

  final String name;
  final String location;
  final String description;
  final int rate;

  @override
  State<AddProsPage> createState() => _AddProsPageState();
}

class _AddProsPageState extends State<AddProsPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
      ]);
    });
  }

  void onContinue() {
    context.push('/add-specialization');
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const TextB(
                    'New university',
                    fontSize: 32,
                    color: AppColors.yellow,
                  ),
                  const SizedBox(height: 50),
                  const FieldTitle('University name'),
                  const SizedBox(height: 10),
                  TxtField(
                    controller: controller1,
                    onChanged: checkActive,
                  ),
                  const SizedBox(height: 20),
                  const FieldTitle('Pros'),
                  const SizedBox(height: 10),
                  TxtField(
                    controller: controller2,
                    onChanged: checkActive,
                  ),
                  const SizedBox(height: 20),
                  const FieldTitle('Cons'),
                  const SizedBox(height: 10),
                  TxtField(
                    controller: controller3,
                    onChanged: checkActive,
                  ),
                  const SizedBox(height: 48),
                  // rate widget
                  const Spacer(),
                  PrimaryButton(
                    title: 'Continue',
                    active: active,
                    onPressed: onContinue,
                  ),
                  SizedBox(height: 77 + getBottom(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
