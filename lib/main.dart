import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitabi/constant.dart';
import 'package:kitabi/core/utils/app_router.dart';

import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const Kitabi());
}

class Kitabi extends StatelessWidget {
  const Kitabi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      routerConfig: AppRouter.router,

    );
  }
}
