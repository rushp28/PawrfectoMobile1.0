import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/common/widgets/layouts/grid_layout.dart';
import 'package:pawrfecto/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:pawrfecto/features/shop/controllers/product_controller.dart';
import 'package:pawrfecto/features/shop/models/product_model.dart';
import 'package:pawrfecto/features/shop/screens/product/product.dart';

import 'widgets/store_appbar.dart';

class StoreScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TStoreAppBar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFilterButton('Pedigree', () {
                        // Handle filter 1 action
                      }),
                      _buildFilterButton('Bakers', () {
                        // Handle filter 2 action
                      }),
                      _buildFilterButton('drools', () {
                        // Handle filter 3 action
                      }),
                      _buildFilterButton('Nestle', () {
                        // Handle filter 4 action
                      }),
                    ],
                  ),
                  const SizedBox(height: 16), // Adjust spacing as needed
                  TGridLayout(
                    itemCount: productController.products.length,
                    itemBuilder: (context, index) {
                      Product product = productController.products[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to product detail page
                          Get.to(ProductDetailScreen(product: product));
                        },
                        child: TProductCardVertical(
                          title: product.title,
                          price: product.price,
                          seller: product.seller,
                          image: product.image,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildFilterButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
