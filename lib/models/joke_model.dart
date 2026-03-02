class JokeModel {
  final int id;
  final String setup;
  final String punchline;

  JokeModel({
    required this.id,
    required this.setup,
    required this.punchline,
  });

  // De JSON a objecte de Dart
  factory JokeModel.fromMap(Map<String, dynamic> map) {
    return JokeModel(
      id: map['id'] ?? 0,
      setup: map['setup'] ?? 'Sense text',
      punchline: map['punchline'] ?? 'Sense text',
    );
  }
}
