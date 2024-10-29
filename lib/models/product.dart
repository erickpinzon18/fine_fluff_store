import 'dart:convert';

Map<String, Product> productFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, Product>(k, Product.fromJson(v)));

String productToJson(Map<String, Product> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Product {
  bool disponible;
  String? imagen;
  String nombre;
  double precio;
  String? id;

  Product({
    required this.disponible,
    this.imagen,
    required this.nombre,
    required this.precio,
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        disponible: json["disponible"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        precio: json["precio"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "disponible": disponible,
        "imagen": imagen,
        "nombre": nombre,
        "precio": precio,
      };

  Product copy() => Product(
        disponible: disponible,
        imagen: imagen,
        nombre: nombre,
        precio: precio,
        id: id,
      );
}
