import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:products/services/producto_service.dart';

class PerfilUsuarioPage extends StatelessWidget {
  const PerfilUsuarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoService = Provider.of<ProductoService>(context);
    final perfilUsuario = productoService.perfilUsuario;

    final String nombreUsuario =
        perfilUsuario?['nombre'] ?? 'Completar en editar perfil';
    final String emailUsuario =
        perfilUsuario?['email'] ?? 'Completar en editar perfil';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tarjeta de Resumen del Usuario
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
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.indigoAccent,
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      nombreUsuario,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      emailUsuario,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Opciones del menú
            const Text(
              'Opciones',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.indigo),
              title: const Text('Editar perfil'),
              onTap: () {
                // Navegar a la página de editar perfil
                Navigator.pushNamed(context, 'editarPerfil');
              },
            ),
            ListTile(
              leading: const Icon(Icons.list, color: Colors.indigo),
              title: const Text('Pedidos'),
              onTap: () {
                // Navegar a la página de pedidos
                Navigator.pushNamed(context, 'pedidos');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.indigo),
              title: const Text('Cerrar sesión'),
              onTap: () {
                // Lógica para cerrar sesión
                _confirmarCerrarSesion(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _confirmarCerrarSesion(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Lógica para cerrar sesión
                Navigator.pushNamed(context, 'login');
              },
              child: const Text('Cerrar sesión'),
            ),
          ],
        );
      },
    );
  }
}
