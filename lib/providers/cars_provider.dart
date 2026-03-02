import 'package:flutter/material.dart';
import '../models/cars_model.dart';
import '../services/car_http_service.dart';

class CarsProvider extends ChangeNotifier {
  List<CarsModel> cars = []; // Llista on guardarem els cotxes
  bool isLoading = true;     // Indicador de "Carregant..."

  final CarHttpService _carHttpService = CarHttpService();

  // El constructor crida la funció només iniciar-se
  CarsProvider() {
    fetchCars();
  }

  Future<void> fetchCars() async {
    isLoading = true;
    notifyListeners(); // Avisa a la pantalla que estem carregant

    try {
      cars = await _carHttpService.getCars();
    } catch (e) {
      print('Error al descarregar els cotxes: $e');
    }

    isLoading = false;
    notifyListeners(); // Avisa a la pantalla que ja tenim les dades
  }
}