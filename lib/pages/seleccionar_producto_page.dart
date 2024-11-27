import 'package:flutter/material.dart';
import 'package:products/services/producto_service.dart';
import 'package:provider/provider.dart';

class SeleccionarProductoPage extends StatefulWidget {
  const SeleccionarProductoPage({super.key});

  @override
  _SeleccionarProductoPageState createState() =>
      _SeleccionarProductoPageState();
}

class _SeleccionarProductoPageState extends State<SeleccionarProductoPage> {
  int cantidad = 1; // Cantidad inicial
  Color colorSeleccionado = Colors.black; // Color por defecto
  String tallaSeleccionada = 'CH'; // Talla por defecto

  @override
  Widget build(BuildContext context) {
    final productoService = Provider.of<ProductoService>(context);
    final product = productoService.productoSeleccionado;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurar Producto'),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[200], // Fondo neutro
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Nombre del producto
                      Text(
                        product?.nombre ?? 'Producto',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),

                      // Precio
                      Text(
                        '\$${product?.precio ?? 250}',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      const SizedBox(height: 20),

                      // Selección de colores
                      const Text(
                        'Seleccionar Color:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _ColorOption(
                            color: Colors.black,
                            isSelected: colorSeleccionado == Colors.black,
                            onTap: () {
                              setState(() {
                                colorSeleccionado = Colors.black;
                              });
                            },
                          ),
                          _ColorOption(
                            color: Colors.white,
                            isSelected: colorSeleccionado == Colors.white,
                            onTap: () {
                              setState(() {
                                colorSeleccionado = Colors.white;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Selección de tallas
                      const Text(
                        'Seleccionar Talla:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _SizeOption(
                            size: 'CH',
                            isSelected: tallaSeleccionada == 'CH',
                            onTap: () {
                              setState(() {
                                tallaSeleccionada = 'CH';
                              });
                            },
                          ),
                          _SizeOption(
                            size: 'MD',
                            isSelected: tallaSeleccionada == 'MD',
                            onTap: () {
                              setState(() {
                                tallaSeleccionada = 'MD';
                              });
                            },
                          ),
                          _SizeOption(
                            size: 'GD',
                            isSelected: tallaSeleccionada == 'GD',
                            onTap: () {
                              setState(() {
                                tallaSeleccionada = 'GD';
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Selección de cantidad
                      const Text(
                        'Cantidad:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              if (cantidad > 1) {
                                setState(() {
                                  cantidad--;
                                });
                              }
                            },
                          ),
                          Text('$cantidad',
                              style: const TextStyle(fontSize: 20)),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                cantidad++;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          if (product != null) {
                            final configuredProduct = product.copyWith(
                              color: colorSeleccionado,
                              talla: tallaSeleccionada,
                              cantidad: cantidad,
                            );
                            productoService.agregarAlCarrito(configuredProduct);
                            Navigator.pushNamed(context, 'carritoCompras');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(
                              8.0), // Puedes ajustar el valor del padding según sea necesario
                          child: Text(
                            'Agregar al Carrito',
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
        ),
      ),
    );
  }
}

class _ColorOption extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _ColorOption({
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: isSelected
              ? Border.all(color: Colors.indigo, width: 2)
              : Border.all(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}

class _SizeOption extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onTap;

  const _SizeOption({
    required this.size,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.indigo : Colors.white,
          border: Border.all(color: Colors.indigo),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
