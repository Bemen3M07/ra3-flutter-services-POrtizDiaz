class CarsModel {
  final int id;
  final int year;
  final String make;
  final String model;
  final String type;

  CarsModel({
    required this.id,
    required this.year,
    required this.make,
    required this.model,
    required this.type,
  });

  // De JSON (Map) a Objecte Flutter
  factory CarsModel.fromMapToCarObject(Map<String, dynamic> map) {
    return CarsModel(
      id: map['id'] ?? 0,
      year: map['year'] ?? 0,
      make: map['make'] ?? 'Desconegut',
      model: map['model'] ?? 'Desconegut',
      type: map['type'] ?? 'Desconegut',
    );
  }

  // D'Objecte Flutter a JSON (Map)
  Map<String, dynamic> fromObjectToMap() {
    return {
      'id': id,
      'year': year,
      'make': make,
      'model': model,
      'type': type,
    };
  }
}
