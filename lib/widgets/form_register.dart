import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/add_user.dart';

class FormRegister extends StatefulWidget {
  final Function(String) onRegisterError;

  const FormRegister({super.key, required this.onRegisterError});

  @override
  // ignore: library_private_types_in_public_api
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Campo de Nombre de Usuario
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: 'UserName',
              labelStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          const SizedBox(height: 20),
          // Campo de E-mail
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'E-mail',
              labelStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          const SizedBox(height: 20),
          // Campo de Contraseña
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          const SizedBox(height: 20),
          // Botón Sign Up
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                String username = usernameController.text;
                String email = emailController.text;
                String password = passwordController.text;

                final response = await agregarDatos(username, email, password);
                showDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Informacion'),
                        content: Text(
                            response['message']), // Muestra el mensaje de error
                        actions: [
                          TextButton(
                            child: const Text('Cerrar'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Cierra el diálogo
                            },
                          ),
                        ],
                      );
                    },
                  );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
