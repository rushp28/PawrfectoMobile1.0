import 'package:flutter/material.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: TColors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: TSizes.iconMD,
              height: TSizes.iconMD,
              image: AssetImage(TImageStrings.google),
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBetweenItems),

        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: TColors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: TSizes.iconMD,
              height: TSizes.iconMD,
              image: AssetImage(TImageStrings.facebook),
            ),
          ),
        ),
      ],
    );
  }
}