import 'package:flutter/material.dart';
import 'package:products/widgets/bg_login.dart';
import 'package:products/widgets/card_container.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgLogin(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 220),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Crear Nueva Cuenta',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _RegisterForm(), // Se mantiene el diseño del formulario
                  ],
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
                child: const Text(
                  'Ya tienes una cuenta? Iniciar sesión',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Correo Electrónico',
              hintText: 'ejemplo@correo.com',
              labelStyle: TextStyle(color: Colors.black54),
              prefixIcon: Icon(Icons.alternate_email, color: Colors.black45),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              hintText: '********',
              labelStyle: TextStyle(color: Colors.black54),
              prefixIcon: Icon(Icons.lock_outline, color: Colors.black45),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Confirma tu Contraseña',
              hintText: '********',
              labelStyle: TextStyle(color: Colors.black54),
              prefixIcon: Icon(Icons.lock_outline, color: Colors.black45),
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: null, // Sin funcionalidad
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.black87,
            disabledColor: Colors.grey[300],
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              child: const Text(
                'Registrar',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
