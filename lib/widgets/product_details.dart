import 'package:flutter/material.dart';

import '../screens/my_sales_page.dart';

class ProductDetails extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String? oldPrice;
  final String price;
  final String description;
  final bool isSponsored;
  final List<String> paymentMethods;
  final String sellerName;
  final String sellerImage;
  final double sellerRating;
  final int sellerSales;
  final String deliveryInfo;
  final String warrantyInfo;
  final String installmentInfo;

  const ProductDetails({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.oldPrice,
    required this.price,
    required this.description,
    required this.isSponsored,
    required this.paymentMethods,
    required this.sellerName,
    required this.sellerImage,
    required this.sellerRating,
    required this.sellerSales,
    required this.deliveryInfo,
    required this.warrantyInfo,
    required this.installmentInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context)
                    .openEndDrawer(); // Abre o menu lateral direito
              },
            ),
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(imageUrl: imageUrl),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Product Delivery, Warranty, and Installment Information
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInfoBox(Icons.local_shipping, deliveryInfo),
                  _buildInfoBox(Icons.verified, warrantyInfo),
                  _buildInfoBox(Icons.credit_card, installmentInfo),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'R\$ $price',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              if (oldPrice != null)
                Text(
                  'R\$ $oldPrice',
                  style: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey.shade700,
                  ),
                ),
              SizedBox(height: 16),
              // Price and Payment Methods
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: paymentMethods
                      .map((method) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade700),
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Image.asset(
                                      method,
                                      height: 50,
                                      width: 50,
                                    )),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
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
                description,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),

              // Seller Information
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(sellerImage),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(sellerName,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Text('$sellerRating • $sellerSales vendas'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Olá, usuário!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Minha Conta'),
              onTap: () {
                // Ação para "Minha Conta"
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Meus Pedidos'),
              onTap: () {
                // Ação para "Meus Pedidos"
              },
            ),
            ListTile(
              leading: Icon(Icons.sell),
              title: Text('Minhas Vendas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MySalesPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.announcement),
              title: Text('Meus Anúncios'),
              onTap: () {
                // Ação para "Meus Anúncios"
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {
                // Ação para "Configurações"
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: () {
                // Ação para "Sair"
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.red),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.red, fontSize: 12)),
      ],
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Image.asset(
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
