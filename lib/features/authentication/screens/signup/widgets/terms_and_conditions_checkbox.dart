import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/features/authentication/controllers/signup/signup_controller.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';
import 'package:pawrfecto/utils/constants/text_strings.dart';
import 'package:pawrfecto/utils/helpers/helper_functions.dart';

class TTermsAndConditionsCheckbox extends StatelessWidget {
  const TTermsAndConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Controller
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx( () => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBetweenItems),

        Text.rich(TextSpan(
          children: [
            TextSpan(text: "${TTextStrings.iAgreeTo} ",
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: "${TTextStrings.privacyPolicy} ",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary
                )
            ),
            TextSpan(text: "${TTextStrings.and} ",
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: TTextStrings.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary
                )
            ),
          ],
        ),)
      ],
    );
  }
}