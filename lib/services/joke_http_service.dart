import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/joke_model.dart';

class JokeHttpService {
  final String _url = 'https://api.sampleapis.com/jokes/goodJokes';

  Future<JokeModel> getRandomJoke() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);

        // Generem un número aleatori entre 0 i la quantitat total d'acudits
        final random = Random();
        int randomIndex = random.nextInt(body.length);

        // Retornem només l'acudit que ha tocat per sort
        return JokeModel.fromMap(body[randomIndex]);
      } else {
        throw Exception(
            'Error al carregar els acudits. Codi: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de connexió: $e');
    }
  }
}
