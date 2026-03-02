import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hello_world/models/cars_model.dart';
import 'package:flutter_hello_world/services/car_http_service.dart';

void main() {
  test('La petició getCars ha de retornar els 10 primers cotxes', () async {
    // 1. Preparem el servei
    final carService = CarHttpService();

    // 2. Executem la funció que es connecta a internet
    final List<CarsModel> cars = await carService.getCars();

    // 3. Comprovem els resultats
    expect(cars, isA<List<CarsModel>>()); 
    expect(cars.isNotEmpty, true); 
    
    // NOU: Comprovem que la llista té exactament 10 cotxes
    expect(cars.length, 10); 
    
    // Imprimim el primer cotxe per veure'l per consola i personalitzar la captura
    print('Test executat per Pedro Ortiz');
    print('S\'han rebut ${cars.length} cotxes en total.');
    print('El primer cotxe rebut és: [ID: ${cars[0].id}] ${cars[0].make} ${cars[0].model} (${cars[0].year}) - Tipus: ${cars[0].type}');
    print('El segon cotxe rebut és: [ID: ${cars[1].id}] ${cars[1].make} ${cars[1].model} (${cars[1].year}) - Tipus: ${cars[1].type}');
    print('El tercer cotxe rebut és: [ID: ${cars[2].id}] ${cars[2].make} ${cars[2].model} (${cars[2].year}) - Tipus: ${cars[2].type}');
    print('El quart cotxe rebut és: [ID: ${cars[3].id}] ${cars[3].make} ${cars[3].model} (${cars[3].year}) - Tipus: ${cars[3].type}');
    print('El cinquè cotxe rebut és: [ID: ${cars[4].id}] ${cars[4].make} ${cars[4].model} (${cars[4].year}) - Tipus: ${cars[4].type}');
    print('El sisè cotxe rebut és: [ID: ${cars[5].id}] ${cars[5].make} ${cars[5].model} (${cars[5].year}) - Tipus: ${cars[5].type}');
    print('El setè cotxe rebut és: [ID: ${cars[6].id}] ${cars[6].make} ${cars[6].model} (${cars[6].year}) - Tipus: ${cars[6].type}');
    print('El vuitè cotxe rebut és: [ID: ${cars[7].id}] ${cars[7].make} ${cars[7].model} (${cars[7].year}) - Tipus: ${cars[7].type}');
    print('El novè cotxe rebut és: [ID: ${cars[8].id}] ${cars[8].make} ${cars[8].model} (${cars[8].year}) - Tipus: ${cars[8].type}');
    print('El desè cotxe rebut és: [ID: ${cars[9].id}] ${cars[9].make} ${cars[9].model} (${cars[9].year}) - Tipus: ${cars[9].type}');
  });
}
