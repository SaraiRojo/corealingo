import 'package:flutter/material.dart';
import 'package:corealingo/src/pages/introduccion_d.dart';  // Asegúrate de crear este archivo
import 'package:corealingo/src/pages/first.dart';

class IntroduccionCPage extends StatelessWidget {
  const IntroduccionCPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context)
        ),
        backgroundColor: const Color(0xFFFFAB91), // Color naranja suave
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: const Color(0xFFFFCCBC), // Color naranja más claro
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'CoreaLingo',
              style: TextStyle(
                color: Color(0xFFD84315), // Color naranja oscuro
                fontFamily: 'Arial',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Vocales',
              style: TextStyle(
                color: Color(0xFFD84315), // Consistencia de color
                fontFamily: 'Arial',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Las vocales coreanas se dividen en dos categorías principales dependiendo de cómo lo pronuncies...\n\n'
                  'Vocales singulares: Una vocal que no cambia desde el principio hasta el final porque la forma de los labios o la posición de la lengua se fijan durante el sonido.\n\n'
                  'Vocales dobles: Una vocal en la que la forma de los labios o la posición de la lengua difiere entre el principio y el final del sonido.',
                  style: TextStyle(
                    color: Colors.black54, // Texto más oscuro para mejorar contraste
                    fontFamily: 'Arial',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => IntroduccionDPage())),
                child: Text('Siguiente', style: TextStyle(fontFamily: 'Arial', fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFFD84315), // Botón naranja oscuro
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
