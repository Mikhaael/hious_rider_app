

import 'package:flutter/cupertino.dart';
import 'package:hious_rider_app/screens/forgot_password.dart/forgot_password.dart';
import 'package:hious_rider_app/screens/login_screen.dart';
import 'package:hious_rider_app/screens/register_screen.dart';
import 'package:hious_rider_app/screens/splash_screen.dart';
import 'package:hious_rider_app/screens/welcome_screen.dart';

class Routes {
  Routes._();

  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = 'login';
  static const String register = 'register';
  static const String password1 = '/password1';
  static const String password2 = '/password2';
  static const String password3 = '/password3';
  static const String password4 = '/password4';

  static Map<String, Widget Function(BuildContext)> routes = {
    splash: (context) => const SplashScreen(),
    welcome: (context) => const WelcomeScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    password1: (context) => const ForgotPasswordScreen(),
  };
}
