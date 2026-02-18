import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:kitabi/constant.dart';
import 'package:kitabi/core/utils/app_router.dart';
import 'package:kitabi/core/utils/assets.dart';
import 'package:kitabi/features/home/presentation/views/home_view.dart';
import 'package:kitabi/features/splash/presentation/views/widgets/slidingText.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedContainer;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSlidingAnimation();

    navigateToHome();
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    animatedContainer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 4),
        Slidingtext(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animatedContainer = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    slidingAnimation = Tween(
      begin: Offset(0, 10),
      end: Offset.zero,
    ).animate(animatedContainer);
    animatedContainer.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(
      //       () => const HomeView(),
      //   transition: Transition.fade,
      //   duration: kTranstionDuration,
      // );
      context.go( AppRouter.kHomeView);
    });
  }
}
