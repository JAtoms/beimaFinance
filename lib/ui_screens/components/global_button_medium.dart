
import 'package:flutter/material.dart';

import '../../helpers/colors.dart';
import '../../helpers/size_config.dart';
import '../../helpers/text_styles.dart';

class GlobalButtonMedium extends StatelessWidget {
  const GlobalButtonMedium(
      {Key? key, required this.btnText, required this.onTap})
      : super(key: key);

  final String btnText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: SizeConfig.heightAdjusted(12),
        margin: const EdgeInsets.symmetric(horizontal: 60),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: GlobalColors.primary,
            borderRadius: BorderRadius.circular(SizeConfig.heightAdjusted(3))),
        child: Text(btnText,
            style:
                GlobalTextStyles.medium(context: context, color: Colors.white)),
      ),
    );
  }
}
