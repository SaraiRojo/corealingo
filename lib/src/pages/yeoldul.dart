import 'package:flutter/material.dart';

class YeoldulPage extends StatelessWidget {
  const YeoldulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Selecciona el número', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '¿Cuál de estas imágenes es: 열둘 (Yeoldul)?',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: <Widget>[
                _buildNumberTile(context, '20', false),
                _buildNumberTile(context, '19', false),
                _buildNumberTile(context, '8', false),
                _buildNumberTile(context, '12', true), // Correct answer
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberTile(BuildContext context, String number, bool isCorrect) {
    return GestureDetector(
      onTap: () => _handleTap(context, isCorrect),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _handleTap(BuildContext context, bool isCorrect) {
    if (isCorrect) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MoreNumbersPage()));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Respuesta Incorrecta', style: TextStyle(color: Colors.white)),
          content: Text('La opción correcta es 12', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MoreNumbersPage()));
              },
              child: Text('Continuar', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      );
    }
  }
}

class MoreNumbersPage extends StatelessWidget {
  const MoreNumbersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Más Números', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Se está trabajando en la incorporación de más números, por el momento no hay disponibles, ten un poco de paciencia y mantente al tanto con el coreano',
            style: TextStyle(color: const Color.fromARGB(255, 231, 21, 21), fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
