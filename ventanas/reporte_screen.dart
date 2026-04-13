import 'package:flutter/material.dart';

class ReporteScreen extends StatefulWidget {
  const ReporteScreen({super.key});

  @override
  State<ReporteScreen> createState() => _ReporteScreenState();
}

class _ReporteScreenState extends State<ReporteScreen> {
  final TextEditingController descripcionController = TextEditingController();

  String tipoSeleccionado = "Orgánico";

  final List<String> tipos = [
    "Orgánico",
    "Plástico",
    "Papel",
    "Vidrio",
    "Metal",
    "Otro"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "¡Reporte a tiempo!",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white
          ),
          ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔹 TÍTULO
            const Text(
              "Crear reporte",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // 🔹 DESCRIPCIÓN
            TextField(
              controller: descripcionController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Descripción",
                hintText: "Describe el problema...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 TIPO DE RESIDUO
            const Text("Tipo de residuo"),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 144, 195, 144)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton(
                value: tipoSeleccionado,
                isExpanded: true,
                underline: const SizedBox(),
                items: tipos.map((tipo) {
                  return DropdownMenuItem(
                    value: tipo,
                    child: Text(tipo),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    tipoSeleccionado = value!;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 BOTÓN IMAGEN
            GestureDetector(
              onTap: () {
                // Aquí puedes abrir galería
              },
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 170, 238, 165),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, size: 40),
                    SizedBox(height: 5),
                    Text("Agregar imagen"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 BOTÓN ENVIAR
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Guardar en SQLite
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Enviar Reporte",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}