import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;
  final String description;
  final bool isSponsored;
  // final List<String> paymentMethods;
  // final String sellerName;
  // final double sellerRating;
  // final int sellerSales;
  // final String deliveryInfo;
  // final String warrantyInfo;
  // final String installmentInfo;

/*

 "id": "1",
      'name': 'Colchão de solteiro de molas',
      'description': 'Pouco uso e bem conservado',
      'price': 400.00,
      'image': 'assets/mattress.png',
      'isSponsored': true,
*/

  const ProductDetails({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.description,
    required this.isSponsored,
    // required this.paymentMethods,
    // required this.sellerName,
    // required this.sellerRating,
    // required this.sellerSales,
    // required this.deliveryInfo,
    // required this.warrantyInfo,
    // required this.installmentInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
              SizedBox(height: 16),
              
              // Product Delivery, Warranty, and Installment Information
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // _buildInfoBox(Icons.local_shipping, deliveryInfo),
                  // _buildInfoBox(Icons.verified, warrantyInfo),
                  // _buildInfoBox(Icons.credit_card, installmentInfo),
                ],
              ),
              SizedBox(height: 16),

              // Price and Payment Methods
              Text(
                'R\$ $price',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 8),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: paymentMethods
              //       .map((method) => Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 4.0),
              //             child: Image.network(
              //               method,
              //               height: 24,
              //             ),
              //           ))
              //       .toList(),
              // ),
              SizedBox(height: 16),

              // Buy and Chat Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart),
                      label: Text("Comprar"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.chat),
                      label: Text("Chat"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Product Description
              Text(
                "Mais Informações",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Esse é um colchão de solteiro com molas ensacadas individualmente, proporcionando suporte uniforme e conforto personalizado.",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),

              // Seller Information
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  SizedBox(width: 8),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(sellerName, style: TextStyle(fontWeight: FontWeight.bold)),
                  //     Row(
                  //       children: [
                  //         Icon(Icons.star, color: Colors.amber, size: 16),
                  //         Text('$sellerRating • $sellerSales vendas'),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.red),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.red)),
      ],
    );
  }
}
