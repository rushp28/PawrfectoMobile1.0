import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';
import 'package:pawrfecto/utils/constants/text_strings.dart';
import 'package:pawrfecto/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(TImageStrings.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBetweenSections),

              // Title and Subtitle
              Text(
                TTextStrings.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBetweenItems),
              Text(
                TTextStrings.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBetweenSections),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(TTextStrings.done),
                ),
              ),

              const SizedBox(height: TSizes.spaceBetweenItems),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(TTextStrings.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
