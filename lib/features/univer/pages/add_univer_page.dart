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
import '../widgets/rate_card.dart';

class AddUniverPage extends StatefulWidget {
  const AddUniverPage({super.key});

  @override
  State<AddUniverPage> createState() => _AddUniverPageState();
}

class _AddUniverPageState extends State<AddUniverPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool active = false;
  int rate = 0;

  void checkActive() {
    if (rate >= 1) {
      setState(() {
        active = getButtonActive([
          controller1,
          controller2,
          controller3,
        ]);
      });
    }
  }

  void onRate(int id) {
    rate = id;
    checkActive();
  }

  void onContinue() {
    // context.read<UniverBloc>().add(
    //       AddUniverEvent(
    //         university: University(
    //           id: getCurrentTimestamp(),
    //           name: controller1.text,
    //           location: controller2.text,
    //           description: controller3.text,
    //           rate: rate,
    //           pros: ['Aa', 'Bb'],
    //           cons: ['Cc', 'Dd'],
    //           specialization: '',
    //           priority: 'First',
    //           tuition: 2000,
    //           studyYears: 4,
    //         ),
    //       ),
    //     );
    // context.pop();
    context.push(
      '/add-pros',
      extra: {
        'name': controller1.text,
        'location': controller2.text,
        'description': controller3.text,
        'rate': rate,
      },
    );
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
                  const FieldTitle('University location'),
                  const SizedBox(height: 10),
                  TxtField(
                    controller: controller2,
                    onChanged: checkActive,
                  ),
                  const SizedBox(height: 20),
                  const FieldTitle('Description of the University'),
                  const SizedBox(height: 10),
                  TxtField(
                    controller: controller3,
                    onChanged: checkActive,
                  ),
                  const SizedBox(height: 48),
                  RateCard(
                    rate: rate,
                    onPressed: onRate,
                  ),
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
