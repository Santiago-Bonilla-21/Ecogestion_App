import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

    void login() async {
  // Validar campos vacíos
  if (emailController.text.isEmpty || passController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Por favor ingresa correo y contraseña'),
      ),
    );
    return; // Detiene la ejecución
  }

  final user = await DBHelper.instance.login(
    emailController.text.trim(),
    passController.text.trim(),
  );

  if (!mounted) return;

  if (user != null) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Correo o contraseña incorrectos'),
      ),
    );
  }
}

  void register() async {
    await DBHelper.instance.insertUser(
      emailController.text,
      passController.text,
    );

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Usuario registrado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // 🔹 FONDO VERDE
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.lightGreen],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // 🔹 CONTENIDO
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  // 🔹 ICONO / LOGO
                  const Icon(
                    Icons.eco,
                    size: 150,
                    color: Colors.white,
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "EcoGestión APP",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 🔹 TARJETA
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 156, 249, 183),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [

                        // EMAIL
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Correo",
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        // PASSWORD
                        TextField(
                          controller: passController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Contraseña",
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // BOTÓN LOGIN
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              "Iniciar sesión",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white
                              ),
                              ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // REGISTRO
                        TextButton(
                          onPressed: register,
                          child: const Text(
                            "Registrarse",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.cyan
                            ),
                            ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}