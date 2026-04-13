import 'package:flutter/material.dart';
import 'package:ecogestion_app/ventanas/organico_screen.dart';

class ClasificacionScreen extends StatelessWidget {
  const ClasificacionScreen({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      "title": "Orgánico",
      "icon": Icons.eco,
      "color": Colors.green
    },
    {
      "title": "Papel",
      "icon": Icons.description,
      "color": Colors.blue
    },
    {
      "title": "Plástico",
      "icon": Icons.local_drink,
      "color": Colors.orange
    },
    {
      "title": "Vidrio",
      "icon": Icons.wine_bar,
      "color": Colors.teal
    },
    {
      "title": "Metal",
      "icon": Icons.build,
      "color": Colors.grey
    },
    {
      "title": "Electrónicos",
      "icon": Icons.devices,
      "color": Colors.purple
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Clasificación de residuos",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white
          ),
          ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columnas
            crossAxisSpacing: 10,
            mainAxisSpacing: 30,
          ),
          itemBuilder: (context, index) {
            final item = items[index];

            return Container(
              decoration: BoxDecoration(
                color: item["color"].withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  // Aquí puedes navegar o mostrar info
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item["icon"],
                      size: 50,
                      color: item["color"],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item["title"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}