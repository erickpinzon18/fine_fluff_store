import 'package:flutter/material.dart';
import 'package:products/widgets/producto_card.dart';
import 'package:provider/provider.dart';
import 'package:products/services/producto_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoService = Provider.of<ProductoService>(context);

    if (productoService.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, 'perfilUsuario');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productoService.productos.length,
        itemBuilder: (context, index) => ProductoCard(
          product: productoService.productos[index],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'carritoCompras');
        },
        child: const Icon(Icons.shopping_cart, color: Colors.white),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
