import 'package:flutter/material.dart';

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
import '../utils/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/res/res_profile.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

const double space = 18;

class _LoginScreenState extends ConsumerState<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var state = LoginScreenState.login;
  final form = GlobalKey<FormState>();

  get nameController => null;

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
            padding:  const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: sPadding * 2,
            ),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ResLoginScreen.signYouIn,
                  style: sLoginScreenText1,
                ),
              ),
              vSpace(space),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ResLoginScreen.welcomeBack,
                  style: sLoginScreenText2,
                ),
              ),
              vSpace(space * 2),
                EmailField(
                  state: TextFieldState(
                    label: ResLoginScreen.email,
                    controller: emailController,
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
              vSpace(space * 0.8),
                PasswordField(
                  state: TextFieldState(
                    label: ResLoginScreen.password,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Password cannot be empty';
                      }
                      return null;
                    }
                  ),
                ),
              vSpace(space * 0.3),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.password1);
                    },
                    child: Text(
                      ResLoginScreen.forgotPassword,
                      style: sLoginScreenText2.copyWith(
                          fontSize: 12,
                          color: kPrimaryColor
                      ),
                    ),
                  ),
                ],
              ),
              vSpace(space * 13.0),
              secondaryButton(
                text: ResLoginScreen.signIn,
                onClick: () {},
                fillColor: kPrimaryColor,
                textColor: Colors.white,
              ),
              // registerButton(
              //     text: ResLoginScreen.signIn,
              //     onClick: () => state.onLoginClick(
              //         form: form,
              //         ref: ref,
              //         nameController: nameController,
              //         emailController: emailController,
              //         passwordController: passwordController,
              //         context: context,
              //     ),
              //     fillColor: kPrimaryColor,
              //     textColor: Colors.white,
              //     isLoading: state.isLoginLoading,
              // ),
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
                    ResLoginScreen.dontHaveAnAccount,
                    style: sLoginScreenText2,
                  ),
                  hSpace(space / 9),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, Routes.register),
                    child: Text(
                      ResLoginScreen.register,
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
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
