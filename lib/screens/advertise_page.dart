import 'package:flutter/material.dart';

class AdvertisePage extends StatefulWidget {
  const AdvertisePage({Key? key}) : super(key: key);

  @override
  State<AdvertisePage> createState() => _AdvertisePageState();
}

class _AdvertisePageState extends State<AdvertisePage> {
  bool isFastDelivery = false;
  bool isGuaranteedDelivery = false;
  bool isSponsored = false;
  double additionalValue = 0;
  double finalValue = 0;
  double productPrice = 0;
  String finalValueText =
      "Valor final (Preço do produto + Adicionais + Taxa): R\$ 0,00";

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
                // Ação para o botão Limpar
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
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Campo de Categoria
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categorias"),
                  TextButton(
                    onPressed: () {
                      // Ação para selecionar Categoria/Subcategoria
                    },
                    child: Text("Categoria/Subcategoria"),
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
                  TextButton(
                    onPressed: () {
                      // Ação para selecionar Estado/Região
                    },
                    child: Text("Selecionar Estado/Região"),
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
              onTap: () {
                // Ação para adicionar foto
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.red,
                  size: 40,
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
                  // Ação para o botão Publicar Anúncio
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
