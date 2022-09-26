
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

import '../../../dependency/cubit/auth_cubit/auth_cubit.dart';
import '../../../dependency/get_it.dart';
import '../../../dependency/navigation/global_routes.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/global_strings.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';
import '../../components/global_back_button.dart';
import '../../components/global_button.dart';
import '../../components/global_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

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
                          rainbowText(title: 'Create ', subTitle: 'Account.'),
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeIn,
                    ),
                    SizedBox(height: SizeConfig.heightAdjusted(2)),
                    Text(setUpPension,
                        style: GlobalTextStyles.regularText(
                            color: Colors.white.withAlpha(170), fontSize: 15)),
                    SizedBox(height: SizeConfig.heightAdjusted(15)),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            GlobalFormField(
                                fieldName: 'First name',
                                keyBoardType: TextInputType.name,
                                textController: firstNameController),
                            SizedBox(height: SizeConfig.heightAdjusted(4)),
                            GlobalFormField(
                                fieldName: 'Last name',
                                keyBoardType: TextInputType.name,
                                textController: lastNameController),
                            SizedBox(height: SizeConfig.heightAdjusted(4)),
                            GlobalFormField(
                                fieldName: 'Email',
                                keyBoardType: TextInputType.emailAddress,
                                textController: emailController),
                            SizedBox(height: SizeConfig.heightAdjusted(4)),
                            GlobalFormField(
                                fieldName: 'Password',
                                keyBoardType: TextInputType.visiblePassword,
                                isEyeVisible: true,
                                textController: passwordController),
                            SizedBox(height: SizeConfig.heightAdjusted(10)),
                            GlobalButton(
                                btnText: signUp,
                                onTap: () {
                                  if (formKey.validate) {
                                    getItInstance<AuthCubit>().signUp(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        context: context);
                                  }
                                }),
                          ],
                        )),
                    SizedBox(height: SizeConfig.heightAdjusted(5)),
                    Center(
                      child: GestureDetector(
                        onTap: () =>
                            globalReplaceWith(route: Routes.loginScreen),
                        child: SizedBox(
                          height: 30,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(alreadyHaveAccount,
                                  style: GlobalTextStyles.regularText(
                                      color: Colors.white.withAlpha(190),
                                      fontSize: 15)),
                              Text(login,
                                  style: GlobalTextStyles.regularText(
                                      color: GlobalColors.primary,
                                      fontSize: 15)),
                            ],
                          ),
                        ),
                      ),
                    ),
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
