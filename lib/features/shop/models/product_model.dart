// product_model.dart

class Product {
  final int id;
  final String title;
  final String seller;
  final String price;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.seller,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      seller: json['seller'],
      price: json['price'],
      image: json['image'],
    );
  }
}