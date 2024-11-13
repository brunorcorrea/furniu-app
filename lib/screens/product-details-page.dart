import 'package:flutter/material.dart';
import 'package:furniu/screens/product-details.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return ProductDetails(
      imageUrl: product['image'],
      productName: product['name'],
      price: product['price'].toStringAsFixed(2),
      description: product['description'],
      isSponsored: product['isSponsored'],
      paymentMethods: product['paymentMethods'],
      sellerName: product['sellerName'],
      sellerRating: product['sellerRating'],
      sellerSales: product['sellerSales'],
      deliveryInfo: product['deliveryInfo'],
      warrantyInfo: product['warrantyInfo'],
      installmentInfo: product['installmentInfo'],
    );
  }
}
