import 'package:flutter/material.dart';
import 'package:products/pages/loading_page.dart';
import 'package:products/services/producto_service.dart';
import 'package:products/widgets/producto_card.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoService = Provider.of<ProductoService>(context);

    if (productoService.isLoading) {
      return const LoadingPage();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: productoService.productos.length,
        itemBuilder: (context, index) => GestureDetector(
          child: ProductoCard(
            product: productoService.productos[index],
          ),
          onTap: () {
            productoService.productoSeleccionado =
                productoService.productos[index].copy();
            Navigator.pushNamed(
              context,
              'producto',
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
