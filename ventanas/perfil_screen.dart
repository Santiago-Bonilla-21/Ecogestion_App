import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // 🔹 HEADER VERDE
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    "https://i.pinimg.com/originals/7b/ae/7d/7bae7d85f91b70ca18bdf0cd07f16ad7.jpg?nii=t",
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Santiago Bonilla",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "correo@email.com",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 TARJETA DE PUNTOS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Puntos acumulados",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "120 pts",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 OPCIONES
          Expanded(
            child: ListView(
              children: [
                _option(Icons.settings, "Configuración"),
                _option(Icons.history, "Historial"),
                _option(Icons.help, "Ayuda"),
                _option(Icons.logout, "Cerrar sesión"),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 🔹 ITEM DE OPCIÓN
  Widget _option(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // acción
      },
    );
  }
}