import 'package:flutter/material.dart';
import 'screens/advertise.dart';

import 'screens/my-sales-page.dart';

void main() {
  runApp(FurniUApp());
}

class FurniUApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FurniU',
      theme: ThemeData(
        primaryColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> products = [
    {
      "id": "1",
      'name': 'Colchão de solteiro de molas',
      'description': 'Pouco uso e bem conservado',
      'price': 400.00,
      'image': 'assets/mattress.png',
      'isSponsored': true,
    },
    {
      "id": "2",
      'name': 'Escrivaninha',
      'description': '70x40 cm',
      'price': 50.00,
      'image': 'assets/desk.png',
      'isSponsored': false,
    },
    {
      "id": "3",
      'name': 'Estante',
      'description': 'Pouco uso e bem conservado',
      'price': 75.00,
      'oldPrice': 80.00,
      'image': 'assets/stand.png',
      'isSponsored': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            Icon(
              Icons.chair_outlined,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'FurniÚ',
              style: TextStyle(
                  fontFamily: 'Sansation',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ],
        ),
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
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          // Página principal com a lista de produtos
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.filter_alt_outlined),
                      onPressed: () {
                        // Ação do filtro
                      },
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Pesquisar',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                        key: Key(product["id"]), product: product);
                  },
                ),
              ),
            ],
          ),
          // Página de anúncio
          AdvertisePage(),
        ],
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Comprar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Anunciar',
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({required Key key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red),
                image: DecorationImage(
                  image: AssetImage(product['image']),
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
                    product['name'],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sansation',
                        color: Colors.red),
                  ),
                  Text(
                    product['description'],
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 5),
                  if (product.containsKey('oldPrice'))
                    Text(
                      'R\$${product['oldPrice'].toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Text(
                    'R\$${product['price'].toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  if (product['isSponsored'])
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          color: Colors.yellow,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 24),
                                child: Text(
                                  'Patrocinado',
                                  style: TextStyle(
                                    fontFamily: 'Sansation',
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
