import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hious_rider_app/utils/designs/colors.dart';
import 'package:hious_rider_app/utils/designs/routes.dart';

import 'firebase_options.dart';

void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const HiousRiderApp());
}

class HiousRiderApp extends StatelessWidget {
  const HiousRiderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: kPrimaryColor,
              secondary: kButtonBackgroundColor,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context)
                  .textTheme
                  .apply(displayColor: kTextColor1, bodyColor: kTextColor1)
                  .copyWith(
                    button: GoogleFonts.poppins(),
                  ),
            )),
        routes: Routes.routes,
      ),
    );
  }
}
