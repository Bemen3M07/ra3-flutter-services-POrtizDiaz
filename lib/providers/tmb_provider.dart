import 'package:flutter/material.dart';
import '../models/tmb_models.dart';
import '../services/tmb_http_service.dart';

class TmbProvider extends ChangeNotifier {
  List<IbusModel> arrivals = [];
  List<TransitLineModel> metroLines = [];
  List<TransitLineModel> busLines = [];

  bool isLoadingIbus = false;
  bool isLoadingNetwork = false;
  String errorMessage = '';

  final TmbHttpService _service = TmbHttpService();

  // Mètode per buscar autobusos per parada
  Future<void> fetchArrivals(String stopCode) async {
    if (stopCode.isEmpty) return;

    isLoadingIbus = true;
    errorMessage = '';
    arrivals = [];
    notifyListeners();

    try {
      arrivals = await _service.getIbus(stopCode);
      if (arrivals.isEmpty)
        errorMessage = 'Cap bus a la vista o parada invàlida.';
    } catch (e) {
      errorMessage = 'Error de connexió amb TMB.';
    }

    isLoadingIbus = false;
    notifyListeners();
  }

  // Mètode per complir el requisit de cridar als altres 2 endpoints
  Future<void> fetchNetworkInfo() async {
    isLoadingNetwork = true;
    notifyListeners();

    try {
      metroLines = await _service.getMetroLines();
      busLines = await _service.getBusLines();
    } catch (e) {
      print('Error carregant xarxa: $e');
    }

    isLoadingNetwork = false;
    notifyListeners();
  }
}
