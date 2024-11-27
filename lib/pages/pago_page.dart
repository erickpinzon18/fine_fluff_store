import 'package:flutter/material.dart';
import 'package:products/models/product.dart';
import 'package:products/services/producto_service.dart';
import 'package:provider/provider.dart';
import 'package:products/models/pedido.dart';

class PagoPage extends StatelessWidget {
  const PagoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoService =
        Provider.of<ProductoService>(context, listen: false);
    final perfilUsuario = productoService.perfilUsuario;

    // Genera un número de referencia basado en la fecha y hora actual
    final DateTime now = DateTime.now();
    final String numeroReferencia =
        'REF-${now.year}${now.month}${now.day}-${now.hour}${now.minute}${now.second}';

    // Crea un nuevo pedido
    final pedido = Pedido(
      referencia: numeroReferencia,
      fecha: now,
      productos: List<Product>.from(productoService.carrito),
      userId: perfilUsuario?['id'] ?? '',
      estado: 'Pendiente',
    );

    // Agrega el pedido al servicio
    productoService.agregarPedido(pedido);

    // Vacía el carrito
    productoService.vaciarCarrito();

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '¡Gracias por tu pedido!',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Número de Referencia:',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    numeroReferencia,
                    style: const TextStyle(fontSize: 24, color: Colors.indigo),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Resumen del Pedido:',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: pedido.productos.length,
                    itemBuilder: (context, index) {
                      final producto = pedido.productos[index];
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                producto.nombre,
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                '\$${producto.precio}',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.green),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: producto.color ?? Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text('Talla: ${producto.talla ?? 'N/A'}'),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text('Cantidad: ${producto.cantidad ?? 1}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Información del Usuario:',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  if (perfilUsuario != null &&
                      perfilUsuario['direccion'] != null &&
                      perfilUsuario['telefono'] != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nombre: ${perfilUsuario['nombre']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Correo Electrónico: ${perfilUsuario['email']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Teléfono: ${perfilUsuario['telefono']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Dirección: ${perfilUsuario['direccion']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Por favor, completa tu información de perfil antes de realizar la transferencia.',
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'editarPerfil');
                          },
                          child: const Text(
                            'Editar Perfil',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.indigo,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 30),
                  const Text(
                    'Por favor, realiza tu transferencia a la siguiente cuenta:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Banco: Santander \nNúmero de cuenta: 137685250019657388\nA nombre de: Fine Fluff S.A. de C.V.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Después de realizar la transferencia, envía un correo con el comprobante a:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'finefluff_purchases@gmail.com',
                    style: TextStyle(fontSize: 18, color: Colors.indigo),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Estado del Pedido:',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Esperando confirmación de pago...',
                    style: TextStyle(fontSize: 18, color: Colors.orange),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Te mantendremos informado sobre el estado de tu pedido.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica para regresar a la página de inicio o carrito
                        Navigator.pushNamed(context, 'home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                      ),
                      child: const Text(
                        'Volver al Inicio',
                        style: TextStyle(fontSize: 20, color: Colors.white),
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
