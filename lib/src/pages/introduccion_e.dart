import 'package:flutter/material.dart';
import 'package:corealingo/src/pages/first.dart';

class IntroduccionEPage extends StatelessWidget {
  const IntroduccionEPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
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
              'Cuando el cielo se encuentra arriba o debajo de tierra, la consonante siempre irá en la parte superior y si el cielo se encuentra a un lado del hombre, la consonante siempre irá antes.',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Arial',
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Image.asset('images/estructura.png', height: 200), // Asegúrate de que la ruta al archivo de imagen es correcta
          ],
        ),
      ),
    );
  }
}
