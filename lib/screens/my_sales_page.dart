import 'package:flutter/material.dart';
import 'package:furniu/model/product.dart';

class MySalesPage extends StatelessWidget {
  final List<Product> soldProducts = [
    Product.optional(
      id: "1",
      name: "Armário duas portas",
      description: "Pouco uso e bem conservado",
      price: 120.00,
      sellerName: "Gabriel Jefferson",
      sellerImage: "assets/buyer1.png",
      sellerRating: 4.0,
      image: "assets/stand_with_doors.png",
    ),
    Product.optional(
      id: "2",
      name: "Espelho",
      description: "Bastante uso e bem conservado",
      price: 255.00,
      sellerName: "Mardoqueu Vaz",
      sellerImage: "assets/buyer2.png",
      sellerRating: 3.0,
      image: "assets/mirror.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Minhas Vendas', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
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
                Navigator.pop(context);
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
      body: ListView.builder(
        itemCount: soldProducts.length,
        itemBuilder: (context, index) {
          final product = soldProducts[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.green),
                          image: DecorationImage(
                            image: AssetImage(product.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              product.description,
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'R\$${product.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(product.sellerImage),
                    ),
                    title: Text(product.sellerName),
                    subtitle: Text("Comprador"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (i) {
                        return Icon(
                          i < product.sellerRating
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.yellow,
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
