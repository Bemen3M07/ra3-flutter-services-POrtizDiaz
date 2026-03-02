import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/tmb_models.dart';

class TmbHttpService {
  // Les teves credencials reals
  final String _appId = 'b8908ea3';
  final String _appKey = '22725f88f982e89af11d085ef02db218';

  // ENDPOINT 1: Temps d'espera per codi de parada
  Future<List<IbusModel>> getIbus(String stopCode) async {
    final url =
        'https://api.tmb.cat/v1/ibus/stops/$stopCode?app_id=$_appId&app_key=$_appKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List ibusData = data['data']['ibus'] ?? [];
      return ibusData.map((e) => IbusModel.fromMap(e)).toList();
    }
    throw Exception('Error al carregar iBus');
  }

  // ENDPOINT 2: Línies de Metro
  Future<List<TransitLineModel>> getMetroLines() async {
    final url =
        'https://api.tmb.cat/v1/transit/linies/metro?app_id=$_appId&app_key=$_appKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List features = data['features'] ?? [];
      return features.map((e) => TransitLineModel.fromMap(e)).toList();
    }
    throw Exception('Error al carregar Metro');
  }

  // ENDPOINT 3: Línies de Bus
  Future<List<TransitLineModel>> getBusLines() async {
    final url =
        'https://api.tmb.cat/v1/transit/linies/bus?app_id=$_appId&app_key=$_appKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List features = data['features'] ?? [];
      return features.map((e) => TransitLineModel.fromMap(e)).toList();
    }
    throw Exception('Error al carregar Bus');
  }
}
