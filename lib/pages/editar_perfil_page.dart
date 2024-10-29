import 'package:flutter/material.dart';

class EditarPerfilPage extends StatelessWidget {
  const EditarPerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo del usuario
    final String nombreUsuario = "Juan Pérez";
    final String emailUsuario = "juan.perez@example.com";
    final String telefonoUsuario = "123-456-7890";
    final String direccionUsuario = "123 Calle Principal, Ciudad";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
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
                    Text(
                      'Nombre',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.indigo),
                        ),
                        hintText: nombreUsuario,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Correo Electrónico',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.indigo),
                        ),
                        hintText: emailUsuario,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Número de Teléfono',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.indigo),
                        ),
                        hintText: telefonoUsuario,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Dirección de Envío',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.indigo),
                        ),
                        hintText: direccionUsuario,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para guardar los cambios
                        _guardarCambios(context);
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
                            'Agregar al Carrito',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _guardarCambios(BuildContext context) {
    // Aquí podrías agregar la lógica para guardar los cambios del perfil
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cambios guardados exitosamente!')),
    );
  }
}
