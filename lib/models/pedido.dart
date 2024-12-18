import 'package:products/models/product.dart';

class Pedido {
  String referencia;
  final DateTime fecha;
  final List<Product> productos;
  String estado;
  String userId;

  Pedido({
    required this.referencia,
    required this.fecha,
    required this.productos,
    required this.userId,
    this.estado = 'Pendiente',
  });

  factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        referencia: json["referencia"],
        fecha: DateTime.parse(json["fecha"]),
        productos: List<Product>.from(
            json["productos"].map((x) => Product.fromJson(x))),
        estado: json["estado"] ?? 'Pendiente',
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "referencia": referencia,
        "fecha": fecha.toIso8601String(),
        "productos": List<dynamic>.from(productos.map((x) => x.toJson())),
        "estado": estado,
        "userId": userId,
      };
}
