import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cars_provider.dart';

class Exercici2Screen extends StatelessWidget {
  const Exercici2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final carsProvider = Provider.of<CarsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('Cotxes de Pedro Ortiz'), // Requisit Rúbrica
      ),
      body: carsProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: carsProvider.cars.length,
              itemBuilder: (context, index) {
                final car = carsProvider.cars[index];
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
