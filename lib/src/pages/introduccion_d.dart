import 'package:flutter/material.dart';
import 'package:corealingo/src/pages/introduccion_e.dart';  // Asegúrate de crear este archivo

class IntroduccionDPage extends StatelessWidget {
  const IntroduccionDPage({Key? key}) : super(key: key);

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
              'Composición',
              style: TextStyle(
                color: Color(0xFFD84315),
                fontFamily: 'Arial',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Para entender la estructura del Hangul, se necesita entender cómo se acomoda el alfabeto. En dónde cielo, tierra y hombre representan las vocales.',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Arial',
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('images/cielo.png', height: 80),  // Asegúrate de que la ruta al archivo de imagen es correcta
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => IntroduccionEPage())),
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
