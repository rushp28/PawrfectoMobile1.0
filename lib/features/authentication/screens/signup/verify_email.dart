import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/common/widgets/sucess_screen/success_screen.dart';
import 'package:pawrfecto/data/repositories/authentication/authentication_repository.dart';
import 'package:pawrfecto/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:pawrfecto/features/authentication/screens/login/login.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';
import 'package:pawrfecto/utils/constants/text_strings.dart';
import 'package:pawrfecto/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({
    super.key,
    this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: const AssetImage(TImageStrings.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),

              const SizedBox(height: TSizes.spaceBetweenSections),

              // Title
              Text(
                TTextStrings.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBetweenItems),

              // User's Email
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),

              // Padding between Title and Subtitle
              const SizedBox(height: TSizes.spaceBetweenItems),

              // Subtitle
              Text(
                TTextStrings.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              // Padding between Subtitle and Continue Button
              const SizedBox(height: TSizes.spaceBetweenSections),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(TTextStrings.tContinue),
                ),
              ),

              // Padding between Continue Button and Resend Email Button
              const SizedBox(height: TSizes.spaceBetweenItems),

              // Resend Email Button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(TTextStrings.resendEmail),
                ),
              ),
            ]
          )
        )
      )
    );
  }
}
