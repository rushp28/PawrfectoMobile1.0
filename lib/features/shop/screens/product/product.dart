import 'package:flutter/material.dart';
import 'package:pawrfecto/features/shop/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Product Title: ${product.title}'),
            Text('Price: ${product.price}'),
            Text('Seller: ${product.seller}'),
            Image.network(product.image), // Assuming image is a URL
          ],
        ),
      ),
    );
  }
}
