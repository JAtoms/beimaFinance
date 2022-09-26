
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:open_mail_app/open_mail_app.dart';

import '../../../dependency/navigation/global_routes.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/global_strings.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';
import '../../components/check_main_screen/check_mail_screen.dart';
import '../../components/global_back_button.dart';
import '../../components/global_button.dart';
import '../../components/global_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();

  void openEmail({required BuildContext context}) async {
    globalReplaceWith(route: Routes.loginScreen);
    var result = await OpenMailApp.openMailApp();
    if (!result.didOpen && result.canOpen) {
      showDialog(
        context: context,
        builder: (_) {
          return MailAppPickerDialog(
            mailApps: result.options,
          );
        },
      );
    }
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
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Image.asset(GlobalAssets.backdrop),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.heightAdjusted(5),
                  right: SizeConfig.heightAdjusted(5),
                  top: SizeConfig.heightAdjusted(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeIn(
                      child:
                          rainbowText(title: 'Forgot ', subTitle: 'Password?'),
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeIn,
                    ),
                    SizedBox(height: SizeConfig.heightAdjusted(2)),
                    Text(letRecover,
                        style: GlobalTextStyles.regularText(
                            color: Colors.white.withAlpha(170), fontSize: 15)),
                    SizedBox(height: SizeConfig.heightAdjusted(15)),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            GlobalFormField(
                                fieldName: 'Email',
                                keyBoardType: TextInputType.emailAddress,
                                textController: emailController),
                            SizedBox(height: SizeConfig.heightAdjusted(20)),
                            GlobalButton(
                                btnText: recover,
                                onTap: () => globalReplaceWith(
                                    route: Routes.checkMailScreen,
                                    arguments: StateParameters(
                                        title: 'Check your mail',
                                        subTitle: checkMail,
                                        image: GlobalAssets.message,
                                        btnText: 'Open Mail',
                                        onTap: () =>
                                            openEmail(context: context),
                                        isBtnVisible: true))),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            const GlobalBackButton(),
          ],
        ),
      ),
    );
  }
}
