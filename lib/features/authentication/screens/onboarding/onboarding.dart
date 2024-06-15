import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:pawrfecto/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:pawrfecto/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/constants/text_strings.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            // Onobarding Pages
            children: const [
              OnboardingPage(
                  image: TImageStrings.onboardingImage1,
                  title: TTextStrings.onboardingTitle1,
                  subTitle: TTextStrings.onboardingSubTitle1
              ),
              OnboardingPage(
                  image: TImageStrings.onboardingImage2,
                  title: TTextStrings.onboardingTitle2,
                  subTitle: TTextStrings.onboardingSubTitle2
              ),
              OnboardingPage(
                  image: TImageStrings.onboardingImage3,
                  title: TTextStrings.onboardingTitle3,
                  subTitle: TTextStrings.onboardingSubTitle3
              ),
            ],
          ),

          // Skip Button
          const OnboardingSkip(),

          // Dot Navigation
          const OnboardingDotNavigation(),

          // Next Button
          const OnboardingNext()
        ],
      )
    );
  }
}

