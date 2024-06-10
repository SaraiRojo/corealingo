import 'package:corealingo/src/pages/pronunciacion.dart';
import 'package:flutter/material.dart';
import 'package:corealingo/src/pages/numero.dart'; // Asegúrate de que la ruta es correcta

class NumerosPage extends StatelessWidget {
  const NumerosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CoreaLingo',
          style: TextStyle(
            fontFamily: 'Times New Roman',
          ),
        ),
        backgroundColor: Color(0xFF002366), // Color azul oscuro
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Color(0xFF002366),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Números',
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildButton(context, 'Números', PronunciacionPage()), // Asumimos que SimplePage es el archivo de vocales simples
                // Puedes cambiar esto por la página correcta
                  _buildButton(context, 'Práctica', NumeroPage()),
                 
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('images/logo.png', height: 150.0, width: 150.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
