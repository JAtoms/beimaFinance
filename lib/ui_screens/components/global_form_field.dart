import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/colors.dart';
import '../../helpers/helpers.dart';
import '../../helpers/size_config.dart';
import '../../helpers/text_styles.dart';

class GlobalFormField extends StatefulWidget {
  final String fieldName;
  final TextInputType keyBoardType;
  final TextEditingController textController;
  final int maxLength;
  final int textLength;
  bool obscureText;
  final isEyeVisible;
  final void Function(String)? onChanged;
  final bool isAutoFocus;
  final FocusNode? focusNode;

  GlobalFormField(
      {Key? key,
      required this.fieldName,
      required this.keyBoardType,
      required this.textController,
      this.focusNode,
      this.onChanged,
      this.obscureText = false,
      this.isAutoFocus = false,
      this.isEyeVisible = false,
      this.textLength = 100,
      this.maxLength = 35})
      : super(key: key);

  @override
  State<GlobalFormField> createState() => _GlobalFormFieldState();
}

class _GlobalFormFieldState extends State<GlobalFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: widget.onChanged,
          focusNode: widget.focusNode,
          controller: widget.textController,
          keyboardType: widget.keyBoardType,
          autofocus: widget.isAutoFocus,
          obscureText: widget.obscureText,
          inputFormatters: [
            widget.keyBoardType == TextInputType.phone
                ? LengthLimitingTextInputFormatter(widget.maxLength)
                : widget.keyBoardType == TextInputType.name ||
                        widget.keyBoardType == TextInputType.emailAddress
                    ? FilteringTextInputFormatter.deny(RegExp(r'\s'))
                    : LengthLimitingTextInputFormatter(widget.textLength)
          ],
          style:
              GlobalTextStyles.regularText(fontSize: 16, color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: Visibility(
                visible: widget.isEyeVisible,
                child: InkWell(
                  onTap: () =>
                      setState(() => widget.obscureText = !widget.obscureText),
                  child: Icon(Icons.remove_red_eye,
                      color: Colors.white.withAlpha(180)),
                )),
            hintText: widget.fieldName,
            labelText: widget.fieldName,
            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthAdjusted(2),
                vertical: SizeConfig.widthAdjusted(2.3)),
            labelStyle: GlobalTextStyles.regularText(
                color: Colors.white.withAlpha(150)),
            filled: true,
            fillColor: GlobalColors.inputField.withAlpha(180),
            hintStyle: GlobalTextStyles.regularText(
                fontSize: 16, color: Colors.white.withAlpha(180)),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: GlobalColors.inputField),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: GlobalColors.primary)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: GlobalColors.primary),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'This input is empty';
            } else if (widget.keyBoardType == TextInputType.emailAddress) {
              if (!isValidEmail(value)) {
                return 'Not a valid email';
              }
            } else if (widget.keyBoardType == TextInputType.name) {
              if (value.length < 3) {
                return 'Not a valid name';
              }
            }
            return null;
          },
        )
      ],
    );
  }
}
