import 'package:flutter/material.dart';
import 'package:pawrfecto/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:pawrfecto/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:pawrfecto/common/widgets/layouts/grid_layout.dart';
import 'package:pawrfecto/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:pawrfecto/common/widgets/texts/section_heading.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';

import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Container
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App Bar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBetweenSections),

                  // Search Bar
                  TSearchContainer(text: 'Search for Products'),
                  SizedBox(height: TSizes.spaceBetweenSections),

                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Categories Heading
                        TSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: TColors.white,),
                        SizedBox(height: TSizes.spaceBetweenItems),

                        // Category Buttons
                        THomeCategories(),
                      ],
                    ),
                  ),

                  SizedBox(height: TSizes.spaceBetweenSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    banners: [
                      TImageStrings.promoBanner1,
                      TImageStrings.promoBanner2,
                      TImageStrings.promoBanner3,
                    ],
                  ),

                  //
                  const SizedBox(height: TSizes.spaceBetweenSections),

                  // Products
                  TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return const TProductCardVertical();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}








