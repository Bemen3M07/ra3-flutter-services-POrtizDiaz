import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/tmb_provider.dart';

class Exercici4Screen extends StatelessWidget {
  const Exercici4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final tmbProvider = Provider.of<TmbProvider>(context);
    final TextEditingController stopController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        foregroundColor: Colors.white,
        title: const Text('TMB'), // REQUISIT RÚBRICA
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // CERCADOR DE PARADA
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: stopController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Codi de parada (Ex: 108, 2775)',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.bus_alert),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Cridem al Provider enviant el text de l'usuari
                    tmbProvider.fetchArrivals(stopController.text.trim());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[700],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: const Text('Buscar'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // LLISTA DE BUSOS QUE ARRIBEN
            Expanded(
              child: tmbProvider.isLoadingIbus
                  ? const Center(child: CircularProgressIndicator())
                  : tmbProvider.errorMessage.isNotEmpty
                      ? Center(
                          child: Text(tmbProvider.errorMessage,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 16)))
                      : ListView.builder(
                          itemCount: tmbProvider.arrivals.length,
                          itemBuilder: (context, index) {
                            final bus = tmbProvider.arrivals[index];
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  child: Text(bus.line,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                title: Text('Destí: ${bus.destination}'),
                                trailing: Text(
                                  bus.time,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              ),
                            );
                          },
                        ),
            ),
            const Divider(),

            // BOTÓ PER CARREGAR ELS ALTRES 2 ENDPOINTS
            tmbProvider.isLoadingNetwork
                ? const CircularProgressIndicator()
                : ElevatedButton.icon(
                    onPressed: () {
                      tmbProvider.fetchNetworkInfo();
                    },
                    icon: const Icon(Icons.download),
                    label: const Text(
                        'Carregar dades globals Xarxa (Metro i Bus)'),
                  ),
            if (tmbProvider.metroLines.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'S\'han carregat ${tmbProvider.metroLines.length} línies de Metro i ${tmbProvider.busLines.length} línies de Bus en segon pla.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
