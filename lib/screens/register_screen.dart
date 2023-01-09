import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hious_rider_app/components/sizes_helpers.dart';

import '../components/buttons.dart';
import '../components/or.dart';
import '../components/spacers.dart';
import '../components/text_field.dart';
import '../utils/auth/auth_state.dart';
import '../utils/designs/assets.dart';
import '../utils/designs/colors.dart';
import '../utils/designs/dimens.dart';
import '../utils/designs/routes.dart';
import '../utils/designs/styles.dart';

import '../utils/res/res_profile.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

const double space = 18;

class _RegisterScreenState extends ConsumerState<RegisterScreen> {

  final emailOrPhoneController = TextEditingController();
  final form = GlobalKey<FormState>();
  get nameController => null;
  get passwordController => null;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginState);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // shadowColor: Colors.transparent,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          hoverColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: form,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: displayWidth(context) * 0.125,
              vertical: displayHeight(context) * 0.05,
            ),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ResRegisterScreen.register,
                  style: sLoginScreenText1,
                ),
              ),
              vSpace(space),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ResRegisterScreen.yourEmail,
                  style: sLoginScreenText2,
                ),
              ),
              vSpace(space * 2),
              EmailField(
                state: TextFieldState(
                  label: ResRegisterScreen.emailOrPhone,
                  controller: emailOrPhoneController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Email cannot be empty';
                      }
                      return null;
                    }
                ),
              ),
              vSpace(space * 13.0),
              // registerButton(
              //   text: ResLoginScreen.signIn,
              //   onClick: () => state.onLoginClick(
              //       form: form,
              //       ref: ref,
              //       nameController: nameController,
              //       emailController: emailOrPhoneController,
              //       passwordController: passwordController,
              //       context: context,
              //   ),
              //   fillColor: kPrimaryColor,
              //   textColor: Colors.white,
              //   isLoading: state.isLoginLoading,
              // ),
              secondaryButton(
                  text: ResRegisterScreen.nextPage,
                  onClick: () {
                    showDataAlert();
                  },
                  fillColor: kPrimaryColor,
                  textColor: Colors.white,
              ),
              vSpace(space * 1.5),
              const Or(),
              vSpace(space * 0.8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialButton(
                    image: Assets.googleLogo,
                    onClick: () {},
                  ),
                  hSpace(space * 0.56),
                  socialButton(
                    image: Assets.twitterLogo,
                    onClick: () {},
                  ),
                  hSpace(space * 0.56),
                  socialButton(
                    image: Assets.facebookLogo,
                    onClick: () {},
                  ),
                ],
              ),
              vSpace(space * 2.9),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ResRegisterScreen.haveAnAccount,
                    style: sLoginScreenText2,
                  ),
                  hSpace(space / 9),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, Routes.login),
                    child: Text(
                      ResRegisterScreen.login,
                      style: sLoginScreenText2.copyWith(
                          color: kPrimaryColor
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showDataAlert() {
    showDialog(
        context: context, 
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: AlertDialog(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 26,
              ),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Check mail",
                    style: sLoginScreenText1.copyWith(
                        color: Colors.white
                    ),
                  ),
                  vSpace(space / 2),
                  Text(
                    "Enter the 4-digits code sent to\n  your mail to verify your email",
                    style: sLoginScreenText2.copyWith(
                      color: Colors.white
                    ),
                  ),
                  vSpace(space * 1.4),
                  const OtpFieldInput(),
                  vSpace(space * 0.7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Resend code to your mail",
                          style: sLoginScreenText2.copyWith(
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                            color: const Color(0xFF9FA8DA),
                          ),
                        ),
                      ),
                    ],
                  ),
                  vSpace(space * 3.0),
                  secondaryButton(
                      text: "Confirm mail",
                      onClick: () {},
                      fillColor: Colors.white,
                      textColor: Colors.black,
                  ),
                ],
              ),
            ),
          );
        },
    );
  }
  
  
  @override
  void dispose() {
    nameController.dispose();
    emailOrPhoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}


