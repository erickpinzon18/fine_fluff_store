import 'package:flutter/material.dart';
import 'package:products/services/producto_service.dart';
import 'package:products/widgets/producto_imagen.dart';
import 'package:provider/provider.dart';

class ProductoPage extends StatelessWidget {
  const ProductoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoService = Provider.of<ProductoService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar Producto'),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[200], // Fondo neutro
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ProductoImagen(
                      url: productoService.productoSeleccionado?.imagen,
                    ),
                  ],
                ),
                const _ProductoInfo(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para agregar al carrito
          Navigator.pushNamed(
            context,
            'congirurarProducto',
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

class _ProductoInfo extends StatelessWidget {
  const _ProductoInfo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nombre de la playera
            _buildSectionTitle('Nombre de la playera:'),
            const Text(
              'Porsche GT3',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Precio
            _buildSectionTitle('Precio:'),
            const Text(
              '\$250',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            const SizedBox(height: 10),

            // Colores
            _buildSectionTitle('Colores disponibles:'),
            const Text('• Negro', style: TextStyle(fontSize: 16)),
            const Text('• Blanco', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),

            // Tallas
            _buildSectionTitle('Tallas disponibles:'),
            const Text('• CH', style: TextStyle(fontSize: 16)),
            const Text('• MD', style: TextStyle(fontSize: 16)),
            const Text('• GD', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 15),

            // Estado de disponibilidad
            _buildSectionTitle('Estado:'),
            const Text(
              'Disponible',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
