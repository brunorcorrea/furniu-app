import 'package:flutter/material.dart';
import 'package:furniu/main.dart';
import 'package:furniu/model/product.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class AdvertisePage extends StatefulWidget {
  final Function(Product) addProduct;

  const AdvertisePage({Key? key, required this.addProduct}) : super(key: key);

  @override
  State<AdvertisePage> createState() => _AdvertisePageState();
}

class _AdvertisePageState extends State<AdvertisePage> {
  File? uploadedImage;
  String selectedState = 'Acre';

  List<String> states = [
    'Acre',
    'Alagoas',
    'Amapá',
    'Amazonas',
    'Bahia',
    'Ceará',
    'Distrito Federal',
    'Espírito Santo',
    'Goiás',
    'Maranhão',
    'Mato Grosso',
    'Mato Grosso do Sul',
    'Minas Gerais',
    'Pará',
    'Paraíba',
    'Paraná',
    'Pernambuco',
    'Piauí',
    'Rio de Janeiro',
    'Rio Grande do Norte',
    'Rio Grande do Sul',
    'Rondônia',
    'Roraima',
    'Santa Catarina',
    'São Paulo',
    'Sergipe',
    'Tocantins',
  ];

  bool isFastDelivery = false;
  bool isGuaranteedDelivery = false;
  bool isSponsored = false;
  double additionalValue = 0;
  double finalValue = 0;
  double productPrice = 0;
  String finalValueText =
      "Valor final (Preço do produto + Adicionais + Taxa): R\$ 0,00";
  String title = '';
  String description = '';

  Future<File?> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return null;

    final appDir = await getApplicationDocumentsDirectory();
    final fileName = path.basename(pickedImage.path);
    final directory = Directory('${appDir.path}/assets');
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    final destinationPath = '${directory.path}/$fileName';
    await pickedImage.saveTo(destinationPath);
    return File(destinationPath);
  }

  void calculateAdditionalValue() {
    additionalValue = 0;
    if (isFastDelivery) {
      additionalValue += 5;
    }
    if (isGuaranteedDelivery) {
      additionalValue += 10;
    }
    if (isSponsored) {
      additionalValue += 20;
    }

    finalValue = productPrice + additionalValue + (productPrice * 0.15);
    finalValueText =
        "Valor final (Preço do produto + Adicionais + Taxa): R\$ ${finalValue.toStringAsFixed(2)}";
    print(finalValueText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  title = '';
                  description = '';
                  isFastDelivery = false;
                  isGuaranteedDelivery = false;
                  isSponsored = false;
                  additionalValue = 0;
                  finalValue = 0;
                  productPrice = 0;
                  finalValueText =
                      "Valor final (Preço do produto + Adicionais + Taxa): R\$ 0,00";
                });
              },
              child: const Text(
                'Limpar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de Título
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.grey[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Título"),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Título do anúncio",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        title = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Campo de Categoria
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.grey[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Descrição"),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Digite a descrição do anúncio",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        description = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Campo de Localização
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Localização"),
                  DropdownButton<String>(
                    value: selectedState,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedState = newValue!;
                      });
                    },
                    items: states.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Campo de Preço
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.grey[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Preço (R\$)"),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Valor",
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          productPrice = 0;
                          calculateAdditionalValue();
                          return;
                        }

                        productPrice = double.parse(value);
                        calculateAdditionalValue();
                        print(productPrice);
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Filtros de Anúncio
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.grey[300],
              child: const Text("Adicione ao seu anúncio:"),
            ),
            const Divider(),
            CheckboxListTile(
              title: const Text("Entrega Rápida (R\$5,00)"),
              value: isFastDelivery,
              onChanged: (bool? value) {
                setState(() {
                  isFastDelivery = value!;
                  calculateAdditionalValue();
                });
              },
            ),
            const Divider(),
            CheckboxListTile(
              title: const Text("Entrega Garantida (R\$10,00)"),
              value: isGuaranteedDelivery,
              onChanged: (bool? value) {
                setState(() {
                  isGuaranteedDelivery = value!;
                  calculateAdditionalValue();
                });
              },
            ),
            const Divider(),
            CheckboxListTile(
              title: const Text("Patrocinado (R\$20,00)"),
              value: isSponsored,
              onChanged: (bool? value) {
                setState(() {
                  isSponsored = value!;
                  calculateAdditionalValue();
                });
              },
            ),
            const SizedBox(height: 10),
            // Botão de Adicionar Foto
            GestureDetector(
              onTap: () async {
                final savedImage = await pickImageFromGallery();
                if (savedImage != null) {
                  setState(() {
                    uploadedImage = savedImage;
                  });
                  print('Foto salva em: ${savedImage.path}');
                } else {
                  print('Nenhuma foto selecionada');
                }
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: uploadedImage != null
                      ? Image.file(
                          uploadedImage!,
                          fit: BoxFit.cover,
                        )
                      : Icon(
                          Icons.camera_alt,
                          color: Colors.red,
                          size: 40,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Botão de Publicar Anúncio
            SizedBox(
              width: double.infinity,
              child: Text(
                finalValueText,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  if (uploadedImage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Por favor, adicione uma imagem.")),
                    );
                    return;
                  }

                  final newProduct = Product(
                    id: DateTime.now().toString(),
                    name: title,
                    description:
                        description + "\n\nLocalização: $selectedState",
                    price: finalValue,
                    image: uploadedImage!.path,
                    isSponsored: isSponsored,
                    paymentMethods: [
                      'assets/mastercard.png',
                      'assets/visa.png',
                      'assets/pix.png',
                      'assets/elo.png',
                      'assets/hipercard.png',
                      'assets/nubank.png',
                    ],
                    sellerName: 'Cleide',
                    sellerImage: 'assets/seller.png',
                    sellerRating: 4.5,
                    sellerSales: 100,
                    deliveryInfo: isFastDelivery
                        ? 'Entrega em até 5 dias úteis'
                        : 'Entrega em até 10 dias úteis',
                    warrantyInfo: isGuaranteedDelivery
                        ? 'Garantia de 30 dias'
                        : 'Sem garantia',
                    installmentInfo: 'Até 12x sem juros',
                  );

                  widget.addProduct(newProduct);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Anúncio publicado com sucesso!"),
                    ),
                  );
                },
                child: const Text(
                  "Publicar Anúncio",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
