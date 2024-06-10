import 'package:corealingo/src/pages/yeoldul.dart';
import 'package:flutter/material.dart';

class HolaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Selecciona Hola', style: TextStyle(color: Colors.orange)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Image.asset('images/robot.png', height: 200),  // Asegúrate que la imagen exista
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOptionButton(context, 'Annyeong-pase', false),
                _buildOptionButton(context, 'Annyeong-haseyo', true),
                _buildOptionButton(context, 'Annyeong-hada', false),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('images/logo.png', height: 100),  // Ajusta según tu archivo de assets
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, String text, bool isCorrect) {
    return ElevatedButton(
      onPressed: () {
        if (isCorrect) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => MoreNumbersPage()));
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Respuesta Incorrecta', style: TextStyle(color: Colors.white)),
              content: Text('La respuesta correcta es Annyeong-haseyo', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.black,
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => MoreNumbersPage()));
                  },
                  child: Text('Continuar', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
