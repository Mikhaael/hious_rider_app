import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hious_rider_app/components/spacers.dart';
import 'package:hious_rider_app/utils/designs/colors.dart';
import 'package:hious_rider_app/utils/res/res_profile.dart';
import 'package:hious_rider_app/components/buttons.dart';
import '../utils/enums.dart';
import '../utils/designs/dimens.dart';
import '../utils/designs/styles.dart';
import '../utils/designs/assets.dart';
import '../components/text_field.dart';
import '../components/or.dart';


class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}
const double space = 18;

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _obscured = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var state = LoginScreenState.login;
  final form = GlobalKey<FormState>();

  void _switch() {
    setState(() {
      if (state == LoginScreenState.login) {
        state = LoginScreenState.signup;
      } else {
        state = LoginScreenState.login;
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    final isLogin = state == LoginScreenState.login;

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
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: sPadding * 2,
            ),
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  isLogin ? ResLoginScreen.signYouIn : ResRegisterScreen.register,
                  style: sLoginScreenText1,
                ),
              ),
              vSpace(space),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  isLogin ? ResLoginScreen.welcomeBack : ResRegisterScreen.yourEmail,
                  style: sLoginScreenText2,
                ),
              ),
              vSpace(space * 2),
              if(!isLogin) ...{
                EmailField(
                  state: TextFieldState(
                    label: ResRegisterScreen.emailOrPhone,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              },
              EmailField(
                  state: TextFieldState(
                    label: ResLoginScreen.email,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
              ),
              vSpace(space),
              // PasswordField(
              //   state: TextFieldState(
              //     controller: passwordController,
              //     keyboardType: TextInputType.visiblePassword,
              //   ),
              // ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                obscureText: _obscured,
                maxLength: 12,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: const Icon(Icons.lock, size: 20.0,),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _obscured = _obscured ? false : true;
                      setState(() {});
                    },
                    child: Icon(
                        _obscured ? Icons.visibility_off : Icons.visibility
                    ),
                  ),
                  hintText: ResLoginScreen.password,
                  hintStyle: sHintTextStyle,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20.8,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(13)
                    ),
                    borderSide: BorderSide(color: Colors.transparent, width: 3.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                    borderSide: BorderSide(
                        color: Colors.transparent, width: 3.0
                    ),
                  ),
                ),
              ),
              vSpace(space * 7),
              primaryButton(
                  text: isLogin ? ResLoginScreen.signIn : ResRegisterScreen.register,
                  onClick: () {},
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
                    image: isLogin ? Assets.googleLogo : Assets.googleLogo,
                    onClick: () {},
                  ),
                  hSpace(space * 0.56),
                  socialButton(
                    image: isLogin ? Assets.twitterLogo : Assets.twitterLogo,
                    onClick: () {},
                  ),
                  hSpace(space * 0.56),
                  socialButton(
                    image: isLogin ? Assets.facebookLogo : Assets.facebookLogo,
                    onClick: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
