import 'package:flutter/material.dart';
import '../models/joke_model.dart';
import '../services/joke_http_service.dart';

class JokeProvider extends ChangeNotifier {
  JokeModel? currentJoke; // Guardem un sol acudit
  bool isLoading = true;

  final JokeHttpService _service = JokeHttpService();

  JokeProvider() {
    fetchNewJoke(); // Carreguem el primer acudit només obrir l'app
  }

  // Aquesta funció es cridarà cada vegada que toquem el botó
  Future<void> fetchNewJoke() async {
    isLoading = true;
    notifyListeners(); // Avisem que estem buscant l'acudit (per mostrar la rodeta)

    try {
      currentJoke =
          await _service.getRandomJoke(); // Demanem un acudit nou al servei
    } catch (e) {
      print('Error: $e');
    }

    isLoading = false;
    notifyListeners(); // Avisem que ja el tenim perquè el dibuixi
  }
}
