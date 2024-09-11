import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../home/presentation/views/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController animate;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    initSliding();
    navigateToHome();

    super.initState();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => const HomeView(),
          transition: Transition.fadeIn, duration: kTrasitionDuration);
    });
  }

  void initSliding() {
    animate = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animate);

    animate.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animate.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingImage(slidingAnimation: slidingAnimation);
  }
}

class SlidingImage extends StatelessWidget {
  const SlidingImage({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Center(
              child: SvgPicture.asset(
                AssetsApp.logo,
                width: 50,
                height: 50,
              ),
            ),
          );
        },
        animation: slidingAnimation,
      ),
    );
  }
}
