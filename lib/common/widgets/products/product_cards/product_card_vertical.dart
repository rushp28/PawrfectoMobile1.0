import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pawrfecto/common/styles/shadows.dart';
import 'package:pawrfecto/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pawrfecto/common/widgets/icons/t_circular_icon.dart';
import 'package:pawrfecto/common/widgets/images/rounded_image.dart';
import 'package:pawrfecto/common/widgets/texts/product_price_text.dart';
import 'package:pawrfecto/common/widgets/texts/product_title_text.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';
import 'package:pawrfecto/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.white,
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          boxShadow: [TShadowStyle.verticalProductShadow],
        ),
      
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.darkContainer : TColors.lightContainer,
              child: Stack(
                children: [
                  const TRoundedImage(imageUrl: TImageStrings.product1, applyImageRadius: true),
      
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
                        ),
                      ),
                  ),
      
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Iconsax.heart,
                      color: Colors.red,
                    ),
                  )
                ]
              ),
            ),
      
            // Padding between Product Card Image and Details
            const SizedBox(height: TSizes.spaceBetweenItems / 2),
      
            // Product Card Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment : CrossAxisAlignment.start,
                children: [
                  const TProductTitleText(title: 'Pet Shampoo - Yellow Edition', smallSize: true),
                  const SizedBox(height: TSizes.spaceBetweenItems / 2),
      
                  Row(
                    children: [
                      Text(
                        'Boop',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyMedium
                      ),
                      const SizedBox(width: TSizes.xs),
      
                      const Icon(Iconsax.verify, color: TColors.primary, size: TSizes.iconXS),
                    ],
                  ),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TProductPriceText(price: '2.5K'),
      
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMD),
                            bottomRight: Radius.circular(TSizes.productImageRadius
                            ),
                          ),
                        ),
      
                        child: SizedBox(
                            width: TSizes.iconLG * 1.2,
                            height: TSizes.iconLG * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: dark ? TColors.black : TColors.white))
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





