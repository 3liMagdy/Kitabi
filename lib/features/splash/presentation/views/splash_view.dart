import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:kitabi/constant.dart';
import 'package:kitabi/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }
}
