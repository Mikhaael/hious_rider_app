import 'package:flutter/material.dart';
import 'package:hious_rider_app/utils/designs/routes.dart';
import 'package:hious_rider_app/utils/designs/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Future.delayed(
      const Duration(seconds: 15),
      () => Navigator.pushReplacementNamed(context, Routes.welcome),
    );
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage(Assets.hiousLogo),
            )
          ],
        ),
      ),
    );
  }
}
