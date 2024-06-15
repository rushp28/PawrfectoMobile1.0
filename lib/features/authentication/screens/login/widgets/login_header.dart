import 'package:flutter/material.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';
import 'package:pawrfecto/utils/constants/text_strings.dart';
import 'package:pawrfecto/utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? TImageStrings.darkAppLogo : TImageStrings.lightAppLogo),
        ),
        const SizedBox(height: TSizes.lg),
        Text(
            TTextStrings.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium
        ),
        const SizedBox(height: TSizes.sm),
        Text(
            TTextStrings.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium
        ),
      ],
    );
  }
}