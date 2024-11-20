import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furniu/model/product.dart';
import 'screens/advertise_page.dart';
import 'screens/my_sales_page.dart';
import 'screens/product_details_page.dart';

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
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;
  String _searchQuery = '';

  final List<Map<String, dynamic>> rawProducts = [
    {
      "id": "1",
      'name': 'Colchão de solteiro de molas',
      'description': 'Pouco uso e bem conservado',
      'price': 400.00,
      'image': 'assets/mattress.png',
      'isSponsored': true,
      'paymentMethods': [
        'assets/mastercard.png',
        'assets/visa.png',
        'assets/pix.png',
        'assets/elo.png',
        'assets/hipercard.png',
        'assets/nubank.png',
      ],
      'sellerName': 'João Silva',
      'sellerImage': 'assets/seller3.png',
      'sellerRating': 4.5,
      'sellerSales': 120,
      'deliveryInfo': 'Entrega em até 5 dias úteis',
      'warrantyInfo': 'Garantia de entrega',
      'installmentInfo': 'Até 12x sem juros',
    },
    {
      "id": "2",
      'name': 'Escrivaninha',
      'description': '70x40 cm',
      'price': 50.00,
      'image': 'assets/desk.png',
      'isSponsored': false,
      'paymentMethods': [
        'assets/mastercard.png',
        'assets/visa.png',
        'assets/pix.png',
        'assets/elo.png',
        'assets/hipercard.png',
        'assets/nubank.png',
      ],
      'sellerName': 'Maria Oliveira',
      'sellerImage': 'assets/seller.png',
      'sellerRating': 4.7,
      'sellerSales': 200,
      'deliveryInfo': 'Entrega em até 7 dias úteis',
      'warrantyInfo': 'Garantia de entrega',
      'installmentInfo': 'Até 6x sem juros',
    },
    {
      "id": "3",
      'name': 'Estante',
      'description': 'Pouco uso e bem conservado',
      'price': 75.00,
      'oldPrice': 80.00,
      'image': 'assets/stand.png',
      'isSponsored': false,
      'paymentMethods': [
        'assets/mastercard.png',
        'assets/visa.png',
        'assets/pix.png',
        'assets/elo.png',
        'assets/hipercard.png',
        'assets/nubank.png',
      ],
      'sellerName': 'Carlos Pereira',
      'sellerImage': 'assets/seller2.png',
      'sellerRating': 4.3,
      'sellerSales': 150,
      'deliveryInfo': 'Entrega em até 3 dias úteis',
      'warrantyInfo': 'Garantia de entrega',
      'installmentInfo': 'Até 10x sem juros',
    },
  ];

  List<Product> products = [];

  void addProduct(Product product) {
    setState(() {
      products.add(product);
    });
  }

  List<Product> sortProductsBySponsorship(List<Product> products) {
    products.sort((a, b) {
      if (a.isSponsored && !b.isSponsored) {
        return -1;
      } else if (!a.isSponsored && b.isSponsored) {
        return 1;
      } else {
        return 0;
      }
    });
    return products;
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_updateSearchQuery);

    products = rawProducts.map((data) => Product.fromMap(data)).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _updateSearchQuery() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
    });
  }

  List<Product> get _filteredProducts {
    if (_searchQuery.isEmpty) {
      sortProductsBySponsorship(products);
      return products.toList();
    } else {
      sortProductsBySponsorship(products);
      return products
          .where((product) =>
              product.name.toLowerCase().contains(_searchQuery) ||
              product.description.toLowerCase().contains(_searchQuery))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
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
                        controller: _searchController,
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
                  itemCount: _filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = _filteredProducts[index];
                    return ProductCard(key: Key(product.id), product: product);
                  },
                ),
              ),
            ],
          ),
          // Página de anúncio

          AdvertisePage(addProduct: addProduct),
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
  final Product product;

  const ProductCard({required Key key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailsPage(product: product);
            },
          ),
        );
      },
      child: Card(
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
                    image: product.image.startsWith("assets")
                        ? AssetImage(product.image) as ImageProvider
                        : FileImage(File(product.image)),
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
                          fontFamily: 'Sansation',
                          color: Colors.red),
                    ),
                    Text(
                      product.description,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 5),
                    if (product.oldPrice != null)
                      Text(
                        'R\$${product.oldPrice?.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Text(
                      'R\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    if (product.isSponsored)
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
      ),
    );
  }
}
