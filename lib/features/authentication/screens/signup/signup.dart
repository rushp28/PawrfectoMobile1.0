import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/common/widgets/login_signup/form_divider.dart';
import 'package:pawrfecto/common/widgets/login_signup/social_buttons.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';
import 'package:pawrfecto/utils/constants/text_strings.dart';

import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                TTextStrings.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBetweenSections),

              // Signup Form
              const TSignupForm(),

              const SizedBox(height: TSizes.spaceBetweenSections),

              // Form Divider
              TFormDivider(dividerText: TTextStrings.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBetweenSections),

              // Social Buttons
              const TSocialButtons(),
            ]
          ),
        ),
      )
    );
  }
}


