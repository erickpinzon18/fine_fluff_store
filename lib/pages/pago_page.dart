import 'package:flutter/material.dart';

class PagoPage extends StatelessWidget {
  const PagoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Genera un número de referencia aleatorio para el pedido
    final String numeroReferencia =
        'REF-${DateTime.now().millisecondsSinceEpoch % 100000}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmación de Pedido'),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '¡Gracias por tu pedido!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Número de Referencia:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  numeroReferencia,
                  style: const TextStyle(fontSize: 20, color: Colors.indigo),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Por favor, realiza tu transferencia a la siguiente cuenta:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Banco: Ejemplo Bank\nNúmero de cuenta: 123456789\nA nombre de: Tu Empresa',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Estado del Pedido:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Esperando confirmación de pago...',
                  style: TextStyle(fontSize: 16, color: Colors.orange),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Te mantendremos informado sobre el estado de tu pedido.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para regresar a la página de inicio o carrito
                    Navigator.pushNamed(context, 'home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                  ),
                  child: const Text(
                    'Volver al Inicio',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
