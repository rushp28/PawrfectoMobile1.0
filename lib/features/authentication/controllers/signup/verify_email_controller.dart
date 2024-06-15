import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/common/widgets/loaders/loaders.dart';
import 'package:pawrfecto/common/widgets/sucess_screen/success_screen.dart';
import 'package:pawrfecto/data/repositories/authentication/authentication_repository.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send Email whenever Verify Screen appears and set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Oh Snap', message: 'Please check your inbox and verify your email.');
    }
    catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(
        const Duration(seconds: 1),
        (timer) async {
          await FirebaseAuth.instance.currentUser?.reload();
          final user = FirebaseAuth.instance.currentUser;
          if (user?.emailVerified ?? false) {
            timer.cancel();
            Get.off(() => SuccesScreen(
                image: TImageStrings.staticSuccessIllustration,
                title: TTextStrings.yourAccountCreatedTitle,
                subtitle: TTextStrings.yourAccountCreatedSubTitle,
                onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            ));
          }
        }
    );
  }

  // Manually check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccesScreen(
          image: TImageStrings.staticSuccessIllustration,
          title: TTextStrings.yourAccountCreatedTitle,
          subtitle: TTextStrings.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      ));
    }
  }
}
