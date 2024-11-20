import 'package:flutter/material.dart';
import 'package:furniu/model/product.dart';
import 'package:furniu/widgets/product_details.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return ProductDetails(
      imageUrl: product.image,
      productName: product.name,
      oldPrice: product.oldPrice?.toStringAsFixed(2),
      price: product.price.toStringAsFixed(2),
      description: product.description,
      isSponsored: product.isSponsored,
      paymentMethods: product.paymentMethods,
      sellerName: product.sellerName,
      sellerImage: product.sellerImage,
      sellerRating: product.sellerRating,
      sellerSales: product.sellerSales,
      deliveryInfo: product.deliveryInfo,
      warrantyInfo: product.warrantyInfo,
      installmentInfo: product.installmentInfo,
    );
  }
}
