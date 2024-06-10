import 'package:flutter/material.dart';
import 'package:corealingo/src/pages/diecinueve_page.dart';

class NumeroPage extends StatelessWidget {
  const NumeroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'CoreaLingo',
            style: TextStyle(color: Colors.orange, fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.orange,
            child: Text(
              '1',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          SizedBox(height: 20),
          Text(
            '하나\nhana',
            style: TextStyle(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DiecinuevePage()));
                },
                child: Text('Verdadero'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Falso'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Image.asset('images/logo.png', height: 150), // Asegúrate de que la ruta a la imagen sea correcta
              ),
            ),
          )
        ],
      ),
    );
  }
}
