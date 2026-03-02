import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cars_provider.dart';

void main() {
  runApp(
    // 1. Emboliquem tota l'app amb el Provider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarsProvider()),
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
      title: 'Llista de Cotxes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Escoltem el provider per veure si hi ha canvis
    final carsProvider = Provider.of<CarsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // ELEMENT DE LA RÚBRICA: Personalització amb el teu nom
        title: const Text('Cotxes de [Pedro Ortiz]'), 
      ),
      // 3. Si està carregant mostrem la rodeta, si no, mostrem la ListView
      body: carsProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: carsProvider.cars.length,
              itemBuilder: (context, index) {
                final car = carsProvider.cars[index];
                // 4. Pintem cada cotxe amb un ListTile (un disseny de fila predeterminat)
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.directions_car),
                  ),
                  title: Text('${car.make} ${car.model}'),
                  subtitle: Text('Any: ${car.year} - Tipus: ${car.type}'),
                  trailing: Text('#${car.id}'),
                );
              },
            ),
    );
  }
}