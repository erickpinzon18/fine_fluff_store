import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:products/models/pedido.dart';
import 'package:products/models/product.dart';
import 'package:http/http.dart' as http;

class ProductoService extends ChangeNotifier {
  final String _baseUrl = 'productos-12e0f-default-rtdb.firebaseio.com';

  final List<Product> productos = [];
  final List<Product> carrito = [];
  final List<Pedido> pedidos = [];

  bool isLoading = true;
  Product? productoSeleccionado;

  ProductoService() {
    obtenerProductos();
    obtenerPedidos();
  }

  Future<List<Product>> obtenerProductos() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'productos.json');
    final resp = await http.get(url);

    if (resp.statusCode != 200) {
      print('Error al obtener productos: ${resp.statusCode}');
      isLoading = false;
      notifyListeners();
      return [];
    }

    final Map<String, dynamic> productosMap = json.decode(resp.body);
    print('Productos obtenidos: $productosMap');

    productos.clear();
    productosMap.forEach((key, value) {
      final tempProduct = Product.fromJson(value);
      tempProduct.id = key;
      productos.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();

    return productos;
  }

  Future<void> agregarProducto(Product product) async {
    final url = Uri.https(_baseUrl, 'productos.json');
    final resp = await http.post(url, body: json.encode(product.toJson()));

    if (resp.statusCode != 200) {
      print('Error al agregar producto: ${resp.statusCode}');
      return;
    }

    final decodedData = json.decode(resp.body);
    product.id = decodedData['name'];

    productos.add(product);
    notifyListeners();
  }

  void agregarAlCarrito(Product product) {
    carrito.add(product);
    notifyListeners();
  }

  Future<void> agregarPedido(Pedido pedido) async {
    final url = Uri.https(_baseUrl, 'pedidos.json');
    final resp = await http.post(url, body: json.encode(pedido.toJson()));

    if (resp.statusCode != 200) {
      print('Error al agregar pedido: ${resp.statusCode}');
      return;
    }

    final decodedData = json.decode(resp.body);
    pedido.referencia = decodedData['name'];

    pedidos.add(pedido);
    notifyListeners();
  }

  Future<void> obtenerPedidos() async {
    final url = Uri.https(_baseUrl, 'pedidos.json');
    final resp = await http.get(url);

    if (resp.statusCode != 200) {
      print('Error al obtener pedidos: ${resp.statusCode}');
      return;
    }

    final Map<String, dynamic> pedidosMap = json.decode(resp.body);
    print('Pedidos obtenidos: $pedidosMap');

    pedidos.clear();
    pedidosMap.forEach((key, value) {
      final tempPedido = Pedido.fromJson(value);
      tempPedido.referencia = key;
      pedidos.add(tempPedido);
    });

    notifyListeners();
  }

  void vaciarCarrito() {
    carrito.clear();
    notifyListeners();
  }

  void vaciarHistorialPedidos() {
    pedidos.clear();
    notifyListeners();
  }
}
