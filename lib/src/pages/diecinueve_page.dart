import 'package:flutter/material.dart';
import 'package:corealingo/src/pages/yeoldul.dart';

class DiecinuevePage extends StatelessWidget {
  const DiecinuevePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('¿Cómo escribes: 19?', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Text(
                      '19',
                      style: TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildOptionButton('Seumul-yeodeolb', false, context),
                  _buildOptionButton('Yeoldul', false, context),
                  _buildOptionButton('Yeol-yeoseos', false, context),
                  _buildOptionButton('Yeol-ahob', true, context), // Correct answer
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/logo.png', height: 100), // Aumentado el tamaño del logo
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(String title, bool isCorrect, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          if (isCorrect) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => YeoldulPage())); // Modify with actual page
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Respuesta Incorrecta', style: TextStyle(color: Colors.white)),
                content: Text('La respuesta correcta es 열아홉 (Yeol-ahob)', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.black,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => YeoldulPage())); // Modify with actual page
                    },
                    child: Text('Continuar', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            );
          }
        },
        child: Text(title),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue,
          minimumSize: Size(double.infinity, 50), // make buttons expand
        ),
      ),
    );
  }
}

