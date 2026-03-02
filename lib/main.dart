import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Importem els providers
import 'providers/cars_provider.dart';
import 'providers/joke_provider.dart';

// Importem les pantalles dels exercicis
import 'exercici2.dart';
import 'exercici3.dart';

void main() {
  runApp(
    // Posem els DOS providers aquí perquè estiguin disponibles a qualsevol pantalla
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarsProvider()),
        ChangeNotifierProvider(create: (_) => JokeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pràctica 5d Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainMenuScreen(),
    );
  }
}

// Pantalla del menú principal
class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botó per anar a l'Exercici 2
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Exercici2Screen()),
                );
              },
              icon: const Icon(Icons.directions_car),
              label: const Text('Anar a Exercici 2 (Cotxes)'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 30),

            // Botó per anar a l'Exercici 3
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Exercici3Screen()),
                );
              },
              icon: const Icon(Icons.sentiment_very_satisfied),
              label: const Text('Anar a Exercici 3 (Acudits)'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
