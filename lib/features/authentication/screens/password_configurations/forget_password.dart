import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pawrfecto/features/authentication/screens/password_configurations/reset_password.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';
import 'package:pawrfecto/utils/constants/text_strings.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              TTextStrings.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBetweenItems),
            Text(
              TTextStrings.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBetweenSections * 2),

            // Text Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: TTextStrings.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),

            const SizedBox(height: TSizes.spaceBetweenSections),
            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.off(() => const ResetPasswordScreen()),
                child: const Text(TTextStrings.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
