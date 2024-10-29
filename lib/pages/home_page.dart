import 'package:flutter/material.dart';
import 'package:products/models/product.dart';
import 'package:products/widgets/producto_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Definir una lista de productos
    final List<Product> productos = [
      Product(
        nombre: "Playera Porsche GT3",
        id: "001",
        imagen: "https://via.placeholder.com/400",
        precio: 250.0,
        disponible: true,
      ),
      Product(
        nombre: "Playera Ferrari",
        id: "002",
        imagen: "https://via.placeholder.com/400",
        precio: 250.0,
        disponible: true,
      ),
      Product(
        nombre: "Playera Oso",
        id: "003",
        imagen: "https://via.placeholder.com/400",
        precio: 250.0,
        disponible: false,
      ),
      Product(
        nombre: "Playera Pato",
        id: "004",
        imagen: "https://via.placeholder.com/400",
        precio: 250.0,
        disponible: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false, // Esto quita el botón de regresar
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Navegar a la página del perfil
              Navigator.pushNamed(context, 'perfilUsuario');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) => ProductoCard(
          product: productos[index],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la página del carrito
          Navigator.pushNamed(context, 'carritoCompras');
        },
        child: const Icon(Icons.shopping_cart),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
