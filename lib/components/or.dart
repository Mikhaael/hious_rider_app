import 'package:flutter/material.dart';
import 'package:hious_rider_app/utils/designs/styles.dart';
import 'package:hious_rider_app/utils/res/res_profile.dart';


class Or extends StatelessWidget {
  const Or({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            ResLoginScreen.orContinueWith,
            style: sLoginScreenText2,
          ),
        )
      ],
    );
  }
}
