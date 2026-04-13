import 'package:flutter/material.dart';
import 'clasificacion_screen.dart';
import 'mapa_screen.dart';
import 'reporte_screen.dart';
import 'perfil_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index == 0 ? _homeUI() : _screens()[index],

      backgroundColor: const Color.fromARGB(255, 205, 255, 208),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color.fromARGB(179, 0, 118, 6),
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Clasificación"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Mapa"),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: "Reporte"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }

  // 🔹 Pantallas
  List<Widget> _screens() {
    return [
      _homeUI(),
      ClasificacionScreen(),
      MapaScreen(),
      ReporteScreen(),
      PerfilScreen(),
    ];
  }

  // 🔥 UI PRINCIPAL (similar a tu diseño)
  Widget _homeUI() {
    return Column(
      children: [

        // 🔹 HEADER VERDE
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hola 👋",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 5),
              Text(
                "¡Bienvenido a Ecogestion APP!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 15),

        // 🔹 TARJETA PRINCIPAL
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: const [
                Icon(Icons.recycling, size: 40, color: Colors.green),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Próxima recolección\nMañana 7:00 AM",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        // 🔹 GRID DE OPCIONES
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            padding: const EdgeInsets.all(10),
            children: [
              _menuItem(Icons.category, "Clasificar", 1),
              _menuItem(Icons.map, "Mapa", 2),
              _menuItem(Icons.report, "Reportar", 3),
              _menuItem(Icons.star, "Puntos", 4),
              _menuItem(Icons.school, "Aprende", 1),
              _menuItem(Icons.person, "Perfil", 4),
            ],
          ),
        ),
      ],
    );
  }

  // 🔹 BOTONES DEL GRID
  Widget _menuItem(IconData icon, String title, int screenIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = screenIndex;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.green),
            const SizedBox(height: 5),
            Text(title),
          ],
        ),
      ),
    );
  }
}