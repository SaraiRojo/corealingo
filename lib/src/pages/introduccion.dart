import 'package:flutter/material.dart';
import 'package:corealingo/src/pages/introduccion_b.dart';

class IntroduccionPage extends StatelessWidget {
  const IntroduccionPage({Key? key}) : super(key: key);

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
              'Historia del Hangul',
              style: TextStyle(
                color: Color(0xFFD84315), // Consistencia de color
                fontFamily: 'Arial',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'El rey Sejong el Grande, quien reinó en Corea durante la dinastía Joseon en el siglo XV, es famoso por desarrollar el Hangul, el alfabeto coreano, en 1443. Antes del Hangul, los coreanos usaban caracteres chinos, accesibles solo para la élite educada. Sejong introdujo el Hangul para permitir que todos los coreanos, independientemente de su clase social, pudieran leer y escribir fácilmente. El nuevo alfabeto, que se hizo oficial en 1446 con la publicación de "Hunminjeongeum", enfrentó resistencia inicial de la élite pero eventualmente se aceptó ampliamente, mejorando significativamente la alfabetización y la educación en Corea.',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Arial',
                fontSize: 18,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => IntroduccionBPage())),
                child: Text('Siguiente'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFFD84315), // Botón naranja oscuro
                ),
              ),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('images/rey.png', height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
