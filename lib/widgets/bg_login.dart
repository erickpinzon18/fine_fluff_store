import 'package:flutter/material.dart';

class BgLogin extends StatelessWidget {
  final Widget child;
  const BgLogin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          const Positioned(
            top: 100, // Ajuste para evitar el notch
            left: 0,
            right: 0,
            child: Center(
              child: Icon(
                Icons.person_pin,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF6A11CB), // Un color violeta suave
            Color(0xFF2575FC), // Transición a un azul claro
          ],
        ),
      ),
      child: const Stack(
        children: [
          Positioned(
            top: 60,
            left: 30,
            child: _Esfera(),
          ),
          Positioned(
            top: 150,
            left: 250,
            child: _Esfera(),
          ),
          Positioned(
            top: 40,
            right: 40,
            child: _Esfera(),
          ),
          Positioned(
            top: 180,
            right: 100,
            child: _Esfera(),
          ),
        ],
      ),
    );
  }
}

class _Esfera extends StatelessWidget {
  const _Esfera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white.withOpacity(0.1), // Opacidad suave
      ),
    );
  }
}
