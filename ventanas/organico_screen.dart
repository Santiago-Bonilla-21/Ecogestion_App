import 'package:flutter/material.dart';

class OrganicoScreen extends StatelessWidget {
  const OrganicoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clasificar - Orgánico'),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Residuos Orgánicos',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Aquí aprenderás cómo identificar y clasificar correctamente los residuos orgánicos para contribuir al cuidado del medio ambiente.',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              '¿Qué son los residuos orgánicos?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Los residuos orgánicos son aquellos que provienen de materia biológica y que pueden descomponerse de forma natural. Generalmente provienen de alimentos o elementos naturales.',
              style: TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 24),

            const Text(
              'Ejemplos de residuos orgánicos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            _buildItem(Icons.eco, 'Restos de frutas y verduras'),
            _buildItem(Icons.restaurant, 'Sobras de comida'),
            _buildItem(Icons.local_florist, 'Cáscaras de huevo'),
            _buildItem(Icons.grass, 'Hojas y ramas pequeñas'),
            _buildItem(Icons.coffee, 'Residuos de café o té'),

            const SizedBox(height: 24),

            const Text(
              '¿Cómo separarlos correctamente?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            _buildStep(
              1,
              'Deposita los residuos orgánicos en una bolsa o recipiente específico para orgánicos.',
            ),
            _buildStep(
              2,
              'Evita mezclar con plásticos, vidrios o metales.',
            ),
            _buildStep(
              3,
              'Si es posible, úsalo para compostaje o entrégalo a un punto de recolección.',
            ),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Volver',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 24),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }

  static Widget _buildStep(int number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.green,
            child: Text(
              '$number',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }
}
