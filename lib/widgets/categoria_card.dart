import 'package:flutter/material.dart';

class CategoriaCard extends StatelessWidget {
  final String titulo;
  final String imageUrl;

  const CategoriaCard({
    super.key,
    required this.titulo,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            _BackgroundImage(imageUrl),
            _CategoriaTitulo(titulo: titulo),
          ],
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final String url;
  const _BackgroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: FadeInImage(
          placeholder: const AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _CategoriaTitulo extends StatelessWidget {
  final String titulo;

  const _CategoriaTitulo({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
