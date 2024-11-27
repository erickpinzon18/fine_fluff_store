import 'package:flutter/material.dart';
import 'package:products/providers/login_form_provider.dart';
import 'package:products/services/producto_service.dart';
import 'package:products/widgets/bg_login.dart';
import 'package:products/widgets/card_container.dart';
import 'package:provider/provider.dart';

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
                    ChangeNotifierProvider(
                      create: (context) => LoginFormProvider(),
                      child: _RegisterForm(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
                child: const Text(
                  '¿Ya tienes una cuenta? Inicia sesión',
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
    final loginForm = Provider.of<LoginFormProvider>(context);
    final productoService =
        Provider.of<ProductoService>(context, listen: false);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : 'Correo no válido';
            },
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
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'Debe tener al menos 6 caracteres';
            },
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
            validator: (value) {
              return (value != null && value == loginForm.password)
                  ? null
                  : 'Las contraseñas no coinciden';
            },
          ),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    if (!loginForm.isValidForm()) return;
                    loginForm.isLoading = true;

                    final registerSuccess = await productoService.register(
                      loginForm.email,
                      loginForm.password,
                    );

                    loginForm.isLoading = false;

                    if (registerSuccess) {
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error al crear la cuenta'),
                        ),
                      );
                    }
                  },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.black87,
            disabledColor: Colors.grey[300],
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              child: Text(
                loginForm.isLoading ? 'Cargando...' : 'Registrar',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
