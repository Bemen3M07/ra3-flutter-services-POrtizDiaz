import 'dart:convert';
import 'package:http/http.dart' as http;
// Importem el model que hem creat abans
import '../models/cars_model.dart';

class CarHttpService {
  // L'adreça a la qual ens connectem
  final String _baseUrl =
      'https://car-data.p.rapidapi.com/cars?limit=10&page=0';

  // Les teves credencials de RapidAPI
  final String _apiKey = '58a8d19d4amsh73f1b8ddfa7d30cp1b2f3bjsn13d7d3154f93';
  final String _apiHost = 'car-data.p.rapidapi.com';

  // Mètode per obtenir la llista de cotxes
  Future<List<CarsModel>> getCars() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'X-RapidAPI-Key': _apiKey,
          'X-RapidAPI-Host': _apiHost,
        },
      );

      // Si la resposta és 200 OK
      if (response.statusCode == 200) {
        // Convertim el text (String) que ens dóna internet a una Llista dinàmica de Mapes
        List<dynamic> body = json.decode(response.body);

        // Mapejem cada element de la llista usant el nostre CarsModel
        List<CarsModel> cars = body
            .map((dynamic item) => CarsModel.fromMapToCarObject(item))
            .toList();

        return cars;
      } else {
        throw Exception(
            'Error al carregar els cotxes. Codi: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de connexió: $e');
    }
  }
}
