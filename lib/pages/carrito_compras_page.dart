import 'package:flutter/material.dart';
import 'package:products/services/producto_service.dart';
import 'package:provider/provider.dart';

class CarritoComprasPage extends StatefulWidget {
  const CarritoComprasPage({super.key});

  @override
  _CarritoComprasPageState createState() => _CarritoComprasPageState();
}

class _CarritoComprasPageState extends State<CarritoComprasPage> {
  void _incrementQuantity(int index) {
    setState(() {
      final productoService =
          Provider.of<ProductoService>(context, listen: false);
      productoService.carrito[index] = productoService.carrito[index].copyWith(
        cantidad: (productoService.carrito[index].cantidad ?? 1) + 1,
      );
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      final productoService =
          Provider.of<ProductoService>(context, listen: false);
      if ((productoService.carrito[index].cantidad ?? 1) > 1) {
        productoService.carrito[index] =
            productoService.carrito[index].copyWith(
          cantidad: (productoService.carrito[index].cantidad ?? 1) - 1,
        );
      }
    });
  }

  void _removeProduct(int index) {
    setState(() {
      final productoService =
          Provider.of<ProductoService>(context, listen: false);
      productoService.carrito.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final productoService = Provider.of<ProductoService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[200],
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Lista de productos en el carrito
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productoService.carrito.length,
                    itemBuilder: (context, index) {
                      final producto = productoService.carrito[index];
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Nombre del producto
                              Text(
                                producto.nombre,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),

                              // Precio
                              Text(
                                '\$${producto.precio}',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.green),
                              ),
                              const SizedBox(height: 10),

                              // Color y talla
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: producto.color ?? Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text('Talla: ${producto.talla ?? 'N/A'}'),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // Cantidad
                              Row(
                                children: [
                                  const Text('Cantidad: '),
                                  Text('${producto.cantidad ?? 1}'),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () => _incrementQuantity(index),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () => _decrementQuantity(index),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => _removeProduct(index),
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Botón para proceder al pago
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'pago');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                      ),
                      child: const Text(
                        'Proceder al Pago',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
