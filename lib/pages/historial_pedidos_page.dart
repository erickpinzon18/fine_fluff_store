import 'package:flutter/material.dart';
import 'package:products/services/producto_service.dart';
import 'package:provider/provider.dart';
import 'package:products/pages/detalles_pedido_page.dart';

class HistorialPedidosPage extends StatelessWidget {
  const HistorialPedidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoService = Provider.of<ProductoService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Pedidos'),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: productoService.pedidos.length,
                    itemBuilder: (context, index) {
                      final pedido = productoService.pedidos[index];
                      final total = pedido.productos.fold<double>(
                        0,
                        (total, producto) =>
                            total +
                            (producto.precio * (producto.cantidad ?? 1)),
                      );

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
                              // Número de referencia
                              Text(
                                'Número de Referencia: ${pedido.referencia}',
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 10),
                              // Estado del pedido
                              Text(
                                'Estado: Esperando Pago', // Puedes ajustar esto según el estado real del pedido
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: _getEstadoColor(
                                      'Esperando Pago'), // Ajusta según el estado real
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Fecha del pedido
                              Text(
                                'Fecha: ${pedido.fecha.toLocal()}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              // Total del pedido
                              Text(
                                'Total: \$${total.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.green),
                              ),
                              const SizedBox(height: 20),
                              // Botón para ver detalles
                              ElevatedButton(
                                onPressed: () {
                                  // Navegar a la página de detalles del pedido
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetallesPedidoPage(pedido: pedido),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        1.0), // Puedes ajustar el valor del padding según sea necesario
                                    child: Text(
                                      'Ver detalles',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Vaciar el historial de pedidos
                    productoService.vaciarHistorialPedidos();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                  ),
                  child: const Text(
                    'Limpiar Historial',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para obtener el color según el estado
  Color _getEstadoColor(String estado) {
    switch (estado) {
      case 'Esperando Pago':
        return Colors.orange;
      case 'En Proceso':
        return Colors.blue;
      case 'Entregado':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}
