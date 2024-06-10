import 'package:flutter/material.dart';
import 'package:corealingo/src/pages/hola.dart';

class GreetingsPage extends StatelessWidget {
  const GreetingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CoreaLingo', style: TextStyle(color: Colors.orange, fontSize: 24)),
        backgroundColor: Colors.black,
        elevation: 0,  // Remueve la sombra del AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/robot.png', height: 200), // Asegúrate de que la ruta a la imagen es correcta
          Text(
            '"Annyeong-haseyo" significa "hola".',
            style: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HolaPage())),
            child: Text('Verdadero'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          ),
          ElevatedButton(
            onPressed: () {}, // Aquí se manejaría la respuesta incorrecta, si es necesario
            child: Text('Falso'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('images/logo.png', height: 50), // Ajusta la altura según necesites
            ),
          ),
        ],
      ),
    );
  }
}

