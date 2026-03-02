// Model pels busos que estan a punt d'arribar a la parada
class IbusModel {
  final String line;
  final String destination;
  final String time;

  IbusModel(
      {required this.line, required this.destination, required this.time});

  factory IbusModel.fromMap(Map<String, dynamic> map) {
    return IbusModel(
      line: map['line'] ?? '??',
      destination: map['destination'] ?? 'Desconegut',
      time: map['text-ca'] ?? '?? min',
    );
  }
}

// Model per a les línies generals (Metro o Bus)
class TransitLineModel {
  final String name;
  final String description;

  TransitLineModel({required this.name, required this.description});

  factory TransitLineModel.fromMap(Map<String, dynamic> map) {
    final properties = map['properties'] ?? {};
    return TransitLineModel(
      name: properties['NOM_LINIA'] ?? '??',
      description: properties['DESC_LINIA'] ?? 'Sense descripció',
    );
  }
}
