import 'package:flutter/material.dart';

class HistorialPedidosPage extends StatelessWidget {
  const HistorialPedidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ejemplo de lista de pedidos
    final List<Map<String, dynamic>> pedidos = [
      {
        'numeroReferencia': 'REF-12345',
        'estado': 'Esperando Pago',
        'fecha': '2024-10-29',
        'total': 500,
      },
      {
        'numeroReferencia': 'REF-67890',
        'estado': 'En Proceso',
        'fecha': '2024-10-28',
        'total': 250,
      },
      {
        'numeroReferencia': 'REF-54321',
        'estado': 'Entregado',
        'fecha': '2024-10-27',
        'total': 250,
      },
    ];

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
            child: ListView.builder(
              itemCount: pedidos.length,
              itemBuilder: (context, index) {
                final pedido = pedidos[index];
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
                          'Número de Referencia: ${pedido['numeroReferencia']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        // Estado del pedido
                        Text(
                          'Estado: ${pedido['estado']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: _getEstadoColor(pedido['estado']),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Fecha del pedido
                        Text(
                          'Fecha: ${pedido['fecha']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        // Total del pedido
                        Text(
                          'Total: \$${pedido['total']}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.green),
                        ),
                        const SizedBox(height: 20),
                        // Botón para ver detalles
                        ElevatedButton(
                          onPressed: () {
                            // Navegar a la página de pago
                            Navigator.pushNamed(context, 'pago');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            padding: const EdgeInsets.symmetric(vertical: 10),
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
