import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:products/models/product.dart';
import 'package:http/http.dart' as http;

class ProductoService extends ChangeNotifier {
  final String _baseUrl = 'productos-12e0f-default-rtdb.firebaseio.com';

  final List<Product> productos = [];

  bool isLoading = true;
  Product? productoSeleccionado;

  ProductoService() {
    obtenerProductos();
  }

  Future obtenerProductos() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'productos.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productosMap = json.decode(resp.body);

    // print(productosMap);
    productosMap.forEach((key, value) {
      final tempProduct = Product.fromJson(value);
      tempProduct.id = key;
      productos.add(tempProduct);
    });

    // print(productos[0].nombre);
    isLoading = false;
    notifyListeners();

    return productos;
  }
}
