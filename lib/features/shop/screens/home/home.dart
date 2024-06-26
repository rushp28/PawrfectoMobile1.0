import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:pawrfecto/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:pawrfecto/common/widgets/layouts/grid_layout.dart';
import 'package:pawrfecto/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:pawrfecto/common/widgets/texts/section_heading.dart';
import 'package:pawrfecto/features/shop/controllers/product_controller.dart';
import 'package:pawrfecto/features/shop/models/product_model.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/image_strings.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';

import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    List<CategoryItem> categories = [
      CategoryItem(
        image: TImageStrings.clothIcon,
        title: 'Clothing',
        onTap: () {
          // Handle onTap for Shoes category
        },
      ),
      CategoryItem(
        image: TImageStrings.toyIcon,
        title: 'Toys',
        onTap: () {
          // Handle onTap for Clothes category
        },
      ),
      CategoryItem(
        image: TImageStrings.animalIcon,
        title: 'Health',
        onTap: () {
          // Handle onTap for Clothes category
        },
      ),
      CategoryItem(
        image: TImageStrings.furnitureIcon,
        title: 'Furniture',
        onTap: () {
          // Handle onTap for Clothes category
        },
      ),
      CategoryItem(
        image: TImageStrings.jeweleryIcon,
        title: 'Accessories',
        onTap: () {
          // Handle onTap for Clothes category
        },
      ),
      CategoryItem(
        image: TImageStrings.electronicsIcon,
        title: 'Electronics',
        onTap: () {
          // Handle onTap for Clothes category
        },
      ),
      // Add more CategoryItems as needed
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Container
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App Bar
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBetweenSections),

                  // Search Bar
                  const TSearchContainer(text: 'Search for Products'),
                  const SizedBox(height: TSizes.spaceBetweenSections),

                  // Categories
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Categories Heading
                        const TSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: TColors.white,),
                        const SizedBox(height: TSizes.spaceBetweenItems),

                        // Category Buttons
                        THomeCategories(items: categories),
                      ],
                    ),
                  ),

                  const SizedBox(height: TSizes.spaceBetweenSections),
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
                  Obx(() => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Your header content here

                              // Replace Column with TGridLayout
                              TGridLayout(
                                itemCount: productController.products.length,
                                itemBuilder: (context, index) {
                                  Product product = productController.products[index];
                                  return TProductCardVertical(
                                    title: product.title,
                                    price: product.price,
                                    seller: product.seller,
                                    image: product.image,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}








