
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../database/plan_model.dart';
import '../../../dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/global_strings.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';
import '../../components/global_back_button.dart';
import '../../components/global_button.dart';

class CreatePlanScreen extends StatefulWidget {
  const CreatePlanScreen({Key? key, required this.planType}) : super(key: key);

  final PlanType planType;

  @override
  State<CreatePlanScreen> createState() => _CreatePlanScreenState();
}

class _CreatePlanScreenState extends State<CreatePlanScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final amountController = TextEditingController();

  @override
  void initState() {
    context.read<DashBoardCubit>().fetchConversionRate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: BlocBuilder<DashBoardCubit, DashBoardState>(
          builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Image.asset(GlobalAssets.backdrop),
              Column(
                children: [
                  GlobalBackButton(
                      titleText: widget.planType == PlanType.flexible
                          ? 'Create a flexible plan'
                          : widget.planType == PlanType.retirement
                              ? 'Create a retirement plan'
                              : widget.planType == PlanType.threeyrs
                                  ? 'Create a 3 years plan'
                                  : widget.planType == PlanType.tenyrs
                                      ? 'Create a 10 years plan'
                                      : '',
                      isTitleVisible: true),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.heightAdjusted(3)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.only(
                                  top: SizeConfig.heightAdjusted(10)),
                              decoration: BoxDecoration(
                                  color: GlobalColors.inputField,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Note:   ',
                                        style: GlobalTextStyles.regularText(
                                            color: Colors.yellow,
                                            fontSize: 13)),
                                    TextSpan(
                                        text: note,
                                        style: GlobalTextStyles.regularText(
                                            color: Colors.white.withAlpha(180),
                                            fontSize: 13)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(5)),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: GlobalColors.inputField,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Form(
                                            key: formKey,
                                            child: AmountField(
                                                onChanged: () {},
                                                amountController:
                                                    amountController),
                                          ),
                                          Text(
                                              formatFiguresNgn(
                                                  state.conversionRate),
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withAlpha(100),
                                                  fontSize: 14))
                                        ]),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: GlobalColors.primary,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text('USD',
                                        style: GlobalTextStyles.title(
                                            color: Colors.white, fontSize: 14)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(2)),
                            Text('Minimum deposit amount: ${formatFigures(25)}',
                                style: GlobalTextStyles.regularText(
                                    color: Colors.white.withAlpha(150),
                                    fontSize: 14)),
                            SizedBox(height: SizeConfig.heightAdjusted(6)),
                            Text('Choose duration',
                                style: GlobalTextStyles.regularText(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(height: SizeConfig.heightAdjusted(6)),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const DurationWidget(
                                        index: 3, title: '3 Months'),
                                    SizedBox(
                                        width: SizeConfig.heightAdjusted(3)),
                                    const DurationWidget(
                                        index: 6, title: '6 Months')
                                  ],
                                ),
                                SizedBox(height: SizeConfig.heightAdjusted(3)),
                                Row(
                                  children: [
                                    const DurationWidget(
                                        index: 9, title: '9 Months'),
                                    SizedBox(
                                        width: SizeConfig.heightAdjusted(3)),
                                    const DurationWidget(
                                        index: 12, title: '12 Months')
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(20)),
                            GlobalButton(
                                btnText: 'Create plan',
                                onTap: () {
                                  if (formKey.validate) {
                                    if (int.tryParse(amountController.text)! >=
                                        20) {
                                      context
                                          .read<DashBoardCubit>()
                                          .createFlexiblePlan(
                                              context: context,
                                              amount: amountController.text,
                                              date: durationType.value);
                                    } else {
                                      globalToast(
                                          'Minimum deposit amount is \$25');
                                    }
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

var durationType = ValueNotifier(3);

class DurationWidget extends StatelessWidget {
  const DurationWidget({Key? key, required this.index, required this.title})
      : super(key: key);

  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: durationType,
        builder: (context, int value, child) {
          return Expanded(
            child: GestureDetector(
              onTap: () => durationType.value = index,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                    color: value == index
                        ? GlobalColors.primary.withAlpha(120)
                        : GlobalColors.inputField,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: Text(title,
                    style: GlobalTextStyles.title(
                        color: Colors.white, fontSize: 14)),
              ),
            ),
          );
        });
  }
}

class AmountField extends StatelessWidget {
  const AmountField({
    Key? key,
    required this.amountController,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController amountController;
  final Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: amountController,
        keyboardType: TextInputType.number,
        onChanged: onChanged(),
        inputFormatters: [LengthLimitingTextInputFormatter(10)],
        style: GlobalTextStyles.regularText(
            fontSize: 16, color: Colors.white.withAlpha(180)),
        validator: (value) {
          if (value!.isEmpty) {
            return 'This input is empty';
          }
        },
        decoration: InputDecoration(
          hintText: '1 USD',
          filled: false,
          hintStyle: GlobalTextStyles.regularText(
              fontSize: 16, color: Colors.white.withAlpha(160)),
          border: InputBorder.none,
        ));
  }
}
