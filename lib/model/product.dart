class Product {
  final String id;
  final String name;
  final String description;
  final double? oldPrice;
  final double price;
  final String image;
  final bool isSponsored;
  final List<String> paymentMethods;
  final String sellerName;
  final String sellerImage;
  final double sellerRating;
  final int sellerSales;
  final String deliveryInfo;
  final String warrantyInfo;
  final String installmentInfo;

  Product({
    required this.id,
    required this.name,
    required this.description,
    this.oldPrice,
    required this.price,
    required this.image,
    required this.isSponsored,
    required this.paymentMethods,
    required this.sellerName,
    required this.sellerImage,
    required this.sellerRating,
    required this.sellerSales,
    required this.deliveryInfo,
    required this.warrantyInfo,
    required this.installmentInfo,
  });

  Product.optional({
    this.id = '',
    this.name = '',
    this.description = '',
    this.oldPrice,
    this.price = 0.0,
    this.image = '',
    this.isSponsored = false,
    this.paymentMethods = const [],
    this.sellerName = '',
    this.sellerImage = '',
    this.sellerRating = 0.0,
    this.sellerSales = 0,
    this.deliveryInfo = '',
    this.warrantyInfo = '',
    this.installmentInfo = '',
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      oldPrice: map['oldPrice'] != null ? map['oldPrice'] as double : null,
      isSponsored: map['isSponsored'] as bool,
      paymentMethods: List<String>.from(map['paymentMethods'] as List),
      sellerName: map['sellerName'] as String,
      sellerImage: map['sellerImage'] as String,
      sellerRating: map['sellerRating'] as double,
      sellerSales: map['sellerSales'] as int,
      deliveryInfo: map['deliveryInfo'] as String,
      warrantyInfo: map['warrantyInfo'] as String,
      installmentInfo: map['installmentInfo'] as String,
    );
  }
}
