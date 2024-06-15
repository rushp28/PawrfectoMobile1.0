import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pawrfecto/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pawrfecto/common/widgets/icons/t_circular_icon.dart';
import 'package:pawrfecto/common/widgets/images/rounded_image.dart';
import 'package:pawrfecto/common/widgets/texts/product_price_text.dart';
import 'package:pawrfecto/common/widgets/texts/product_title_text.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';

class TProductCardVertical extends StatelessWidget {
  final String title;
  final String seller;
  final String price;
  final String image;
  final bool verified;

  const TProductCardVertical({
    required this.title,
    required this.seller,
    required this.price,
    required this.image,
    this.verified = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        // Handle onTap action
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.white,
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          boxShadow: [BoxShadow(color: dark ? Colors.black54 : Colors.grey, blurRadius: 6, offset: const Offset(0, 2))],
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.darkContainer : TColors.lightContainer,
              child: Stack(
                children: [
                  TRoundedImage(imageUrl: image, applyImageRadius: true),
                  if (verified)
                    Positioned(
                      top: 12,
                      child: TRoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor: TColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text(
                          '25%',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: TColors.black),
                        ),
                      ),
                    ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBetweenItems / 2),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: title, smallSize: true),
                  const SizedBox(height: TSizes.spaceBetweenItems / 2),
                  Row(
                    children: [
                      Text(
                        seller,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: TSizes.xs),
                      if (verified) const Icon(Iconsax.verify, color: TColors.primary, size: TSizes.iconXS),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBetweenItems / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TProductPriceText(price: price),
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMD),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: SizedBox(
                          width: TSizes.iconLG * 1.2,
                          height: TSizes.iconLG * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: dark ? TColors.black : TColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}