import 'package:flutter/material.dart';
import 'package:hious_rider_app/components/buttons.dart';
import 'package:hious_rider_app/components/spacers.dart';
import 'package:hious_rider_app/utils/designs/assets.dart';
import 'package:hious_rider_app/utils/designs/colors.dart';
import 'package:hious_rider_app/utils/res/res_profile.dart';
import 'package:hious_rider_app/utils/designs/styles.dart';
import '../utils/designs/routes.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

const double space = 18.0;

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage(Assets.deliveryMan),
                ),
                vSpace(space / 2),
                Text(
                  ResWelcomeScreen.welcomeMessage1,
                  style: sWelcomeScreenBigText,
                ),
                vSpace(space),
                Text(
                  ResWelcomeScreen.welcomeMessage2,
                  style: sWelcomeScreenSmallText,
                ),
                vSpace(space * 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    primaryButton(
                      text: ResWelcomeScreen.register,
                      onClick: () => Navigator.pushNamed(context, Routes.register),
                      fillColor: kPrimaryColor,
                      textColor: Colors.white,
                    ),
                    // hSpace(space),
                    primaryButton(
                      text: ResWelcomeScreen.login,
                      onClick: () => Navigator.pushNamed(context, Routes.login),
                      fillColor: Colors.transparent,
                      textColor: Colors.black,
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
