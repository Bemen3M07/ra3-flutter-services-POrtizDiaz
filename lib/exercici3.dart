import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/joke_provider.dart';

class Exercici3Screen extends StatelessWidget {
  const Exercici3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final jokeProvider = Provider.of<JokeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Text('Acudits de Pedro Ortiz'), // Requisit Rúbrica
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: jokeProvider.isLoading
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.sentiment_very_satisfied,
                        size: 80, color: Colors.teal),
                    const SizedBox(height: 30),
                    Text(
                      jokeProvider.currentJoke?.setup ?? 'Sense pregunta',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      jokeProvider.currentJoke?.punchline ?? 'Sense resposta',
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 22, color: Colors.blueGrey),
                    ),
                  ],
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          jokeProvider.fetchNewJoke();
        },
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        label: const Text('Nou Acudit'),
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
