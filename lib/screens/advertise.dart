import 'package:flutter/material.dart';

class AdvertisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                // Ação para o botão Limpar
              },
              child: Text(
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
            // Campo de Categoria
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            SizedBox(height: 10),
            // Campo de Localização
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            SizedBox(height: 10),
            // Campo de Preço
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.grey[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Preço (R\$)"),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Valor",
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Filtros de Anúncio
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.grey[300],
              child: Text("Adicione ao seu anúncio:"),
            ),
            Divider(),
            CheckboxListTile(
              title: Text("Entrega Rápida"),
              value: false,
              onChanged: (bool? value) {
                // Ação para filtro de Entrega Rápida
              },
            ),
            Divider(),
            CheckboxListTile(
              title: Text("Entrega Garantida"),
              value: false,
              onChanged: (bool? value) {
                // Ação para filtro de Entrega Garantida
              },
            ),
            Divider(),
            CheckboxListTile(
              title: Text("Patrocinado"),
              value: false,
              onChanged: (bool? value) {
                // Ação para filtro de Patrocinado
              },
            ),
            SizedBox(height: 10),
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
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Botão de Publicar Anúncio
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  // Ação para o botão Publicar Anúncio
                },
                child: Text(
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
