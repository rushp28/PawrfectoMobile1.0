// product_controller.dart

import 'dart:convert' as convert;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pawrfecto/features/shop/models/product_model.dart';

class ProductController extends GetxController {
  RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  Future<void> loadProducts() async {
    try {
      String jsonString = await rootBundle.loadString('assets/json_data/products.json');
      List<dynamic> jsonList = convert.jsonDecode(jsonString);
      products.assignAll(jsonList.map((json) => Product.fromJson(json)).toList());
    } catch (e) {
      print('Error loading products: $e');
    }
  }
}
