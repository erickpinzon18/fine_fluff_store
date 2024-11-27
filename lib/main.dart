import 'package:flutter/material.dart';
import 'package:products/pages/carrito_compras_page.dart';
import 'package:products/pages/editar_perfil_page.dart';
import 'package:products/pages/historial_pedidos_page.dart';
import 'package:products/pages/home_page.dart';
import 'package:products/pages/login_page.dart';
import 'package:products/pages/pago_page.dart';
import 'package:products/pages/perfil_usuario_page.dart';
import 'package:products/pages/producto_page.dart';
import 'package:products/pages/register_page.dart';
import 'package:products/pages/seleccionar_producto_page.dart';
import 'package:provider/provider.dart';
import 'package:products/services/producto_service.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ProductoService(),
      )
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'login': (context) => const LoginPage(),
        'register': (context) => const RegisterPage(),
        'home': (context) => const HomePage(),
        'producto': (context) => const ProductoPage(),
        'congirurarProducto': (context) => const SeleccionarProductoPage(),
        'carritoCompras': (context) => const CarritoComprasPage(),
        'pago': (context) => const PagoPage(),
        'perfilUsuario': (context) => const PerfilUsuarioPage(),
        'editarPerfil': (context) => const EditarPerfilPage(),
        'pedidos': (context) => const HistorialPedidosPage(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Color.fromARGB(255, 159, 159, 159),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
        ),
      ),
    );
  }
}
