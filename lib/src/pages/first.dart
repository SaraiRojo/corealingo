import 'package:corealingo/src/pages/numeros.dart';
import 'package:flutter/material.dart';
import 'package:corealingo/src/account/usuario.dart';
import 'package:corealingo/src/pages/hangul.dart';
import 'package:corealingo/src/pages/saludo.dart';
import 'package:corealingo/src/pages/introduccion.dart';


class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'images/rey.png',
      'images/hangul.png',
      'images/numeros.png',
      'images/saludos.png'
  
    ];
    List<String> titles = [
      'Introducción',
      'Hangul',
      'Numero',
      'Saludo',
      
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CoreaLingo',
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(16.0),
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: List.generate(
                  images.length,
                  (index) => GridItem(
                    image: images[index],
                    title: titles[index],
                    onTap: () {
                      switch (titles[index]) {
                        case 'Usuario':
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UsuarioPage()));
                          break;
                        case 'Hangul':
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HangulPage()));
                          break;
                        
                        case 'Introducción':
                          Navigator.push(context, MaterialPageRoute(builder: (context) => IntroduccionPage()));
                          break;
                         case 'Numero':
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NumerosPage()));
                          break;  
                        case 'Saludo':
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GreetingsPage()));
                          break; 
                        default:
                          break;
                      }
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/logo.png', height: 150.0),
                  IconButton(
                    icon: Icon(Icons.person, color: Colors.yellow, size: 50.0),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UsuarioPage()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const GridItem({
    required this.image,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Times New Roman',
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 120.0,
                width: 120.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}