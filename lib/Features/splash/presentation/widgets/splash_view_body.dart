import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
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
