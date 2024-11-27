import 'package:flutter/material.dart';

class Product {
  bool disponible;
  String? imagen;
  String nombre;
  double precio;
  String? id;
  int? cantidad;
  String? talla;
  Color? color;

  Product({
    required this.disponible,
    this.imagen,
    required this.nombre,
    required this.precio,
    this.id,
    this.cantidad,
    this.talla,
    this.color,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        disponible: json["disponible"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        precio: json["precio"]?.toDouble(),
        id: json["id"],
        cantidad: json["cantidad"],
        talla: json["talla"],
        color: json["color"] != null ? Color(int.parse(json["color"])) : null,
      );

  Map<String, dynamic> toJson() => {
        "disponible": disponible,
        "imagen": imagen,
        "nombre": nombre,
        "precio": precio,
        "id": id,
        "cantidad": cantidad,
        "talla": talla,
        "color": color != null ? color!.value.toString() : null,
      };

  Product copyWith({
    bool? disponible,
    String? imagen,
    String? nombre,
    double? precio,
    String? id,
    int? cantidad,
    String? talla,
    Color? color,
  }) {
    return Product(
      disponible: disponible ?? this.disponible,
      imagen: imagen ?? this.imagen,
      nombre: nombre ?? this.nombre,
      precio: precio ?? this.precio,
      id: id ?? this.id,
      cantidad: cantidad ?? this.cantidad,
      talla: talla ?? this.talla,
      color: color ?? this.color,
    );
  }
}
