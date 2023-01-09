import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hious_rider_app/components/buttons.dart';
import 'package:hious_rider_app/components/spacers.dart';
import 'package:hious_rider_app/utils/designs/assets.dart';
import 'package:hious_rider_app/utils/designs/colors.dart';
import 'package:hious_rider_app/utils/res/res_profile.dart';

import '../../components/sizes_helpers.dart';
import '../../components/text_field.dart';
import '../../utils/designs/dimens.dart';
import '../../utils/designs/styles.dart';
import '../login_screen.dart';


class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

const double space = 18;

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {

  final form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
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
              const Image(
                  image: AssetImage(Assets.forgetPassword),
              ),
              vSpace(space * 0.2),
              Text(
                ResPasswordResetScreen1.forgotPassword,
                style: sLoginScreenText1,
              ),
              vSpace(space * 0.8),
              Text(
                ResPasswordResetScreen1.accountBack,
                style: sLoginScreenText2,
              ),
              vSpace(space * 0.75),
              EmailField(
                state: TextFieldState(
                  label: ResPasswordResetScreen1.email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
              ),
              vSpace(space * 4.4),
              primaryButton(
                  text: ResPasswordResetScreen1.resetPassword,
                  onClick: () {},
                  fillColor: kPrimaryColor,
                  textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
