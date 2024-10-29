import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Producto'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
      ),
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.indigo,
        ),
      ),
    );
  }
}
