import 'package:corealingo/src/pages/introduccion.dart';
import 'package:flutter/material.dart';
import 'package:corealingo/src/pages/introduccion_c.dart';
import 'package:corealingo/src/pages/first.dart';

class IntroduccionBPage extends StatelessWidget {
  const IntroduccionBPage({Key? key}) : super(key: key);

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
              'Hangul',
              style: TextStyle(
                color: Color(0xFFD84315),
                fontFamily: 'Arial',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'El Hangul consiste en 10 vocales básicas y 14 consonantes básicas, que pueden combinarse para formar diversos grupos silábicos. Es muy simple, sistemático y fácil de aprender.',
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
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => IntroduccionCPage())),
                child: Text('Continuar', style: TextStyle(fontFamily: 'Arial', fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFFD84315), // Botón naranja oscuro
                ),
              ),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('images/logo.png', height: 100),  // Asegúrate de que la ruta al archivo de imagen es correcta
            ),
          ],
        ),
      ),
    );
  }
}

