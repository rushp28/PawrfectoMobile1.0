import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:pawrfecto/common/widgets/images/rounded_image.dart';
import 'package:pawrfecto/features/shop/controllers/home_controller.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updateCarousalIndex(index),
          ),
          items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(height: TSizes.spaceBetweenItems),

        Center(
          child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: TSizes.defaultSpace),
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? TColors.primary
                        : Colors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}