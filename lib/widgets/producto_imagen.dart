import 'package:flutter/material.dart';

class ProductoImagen extends StatelessWidget {
  final String? url;
  const ProductoImagen({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Container(
        width: double.infinity,
        height: 450,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          child: url == null
              ? Image.asset(
                  'assets/no-image.png',
                  fit: BoxFit.cover,
                )
              : FadeInImage(
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(url!),
                  fit: BoxFit.cover),
        ),
      ),
    );
  }
}
