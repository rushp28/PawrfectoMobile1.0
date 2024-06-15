import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/common/styles/spacing_styles.dart';
import 'package:pawrfecto/common/widgets/login_signup/form_divider.dart';
import 'package:pawrfecto/common/widgets/login_signup/social_buttons.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';
import 'package:pawrfecto/utils/constants/text_strings.dart';

import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title and Subtitle
              const TLoginHeader(),

              // Login Form
              const TLoginForm(),

              // Form Divider
              TFormDivider(dividerText: TTextStrings.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBetweenSections),

              // Social Buttons
              const TSocialButtons(),
            ],
          )
        ),
      )
    );
  }
}







