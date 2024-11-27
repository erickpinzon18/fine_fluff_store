import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:products/services/producto_service.dart';

class EditarPerfilPage extends StatelessWidget {
  const EditarPerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoService = Provider.of<ProductoService>(context);
    final perfilUsuario = productoService.perfilUsuario;

    final TextEditingController nombreController =
        TextEditingController(text: perfilUsuario?['nombre'] ?? '');
    final TextEditingController emailController =
        TextEditingController(text: perfilUsuario?['email'] ?? '');
    final TextEditingController telefonoController =
        TextEditingController(text: perfilUsuario?['telefono'] ?? '');
    final TextEditingController direccionController =
        TextEditingController(text: perfilUsuario?['direccion'] ?? '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Tarjeta de Edición del Usuario
              Card(
                elevation: 8,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nombre',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: nombreController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.indigo),
                          ),
                          hintText: 'Nombre',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Correo Electrónico',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: emailController,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.indigo),
                          ),
                          hintText: 'Correo Electrónico',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Número de Teléfono',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: telefonoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.indigo),
                          ),
                          hintText: 'Número de Teléfono',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Dirección de Envío',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: direccionController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.indigo),
                          ),
                          hintText: 'Dirección de Envío',
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Lógica para guardar los cambios
                          _guardarCambios(context, productoService, {
                            'nombre': nombreController.text,
                            'email': emailController.text,
                            'telefono': telefonoController.text,
                            'direccion': direccionController.text,
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 5,
                                right:
                                    5), // Puedes ajustar el valor del padding según sea necesario
                            child: Text(
                              'Guardar Cambios',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                  height: 20), // Espacio adicional en la parte inferior
            ],
          ),
        ),
      ),
    );
  }

  void _guardarCambios(BuildContext context, ProductoService productoService,
      Map<String, dynamic> perfil) async {
    final userId = productoService.perfilUsuario?['id'];
    if (userId != null) {
      await productoService.actualizarPerfilUsuario(userId, perfil);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cambios guardados exitosamente!')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al guardar los cambios')),
      );
    }
  }
}
