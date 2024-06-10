import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:corealingo/src/account/login.dart';

class UsuarioPage extends StatelessWidget {
  UsuarioPage({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    String displayName = user?.displayName ?? 'Nombre no disponible';
    String email = user?.email ?? 'Email no disponible';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
        elevation: 0, // Elimina la sombra de la AppBar
        title: Text('CoreaLingo', style: TextStyle(color: Colors.grey, fontFamily: 'Times New Roman', fontSize: 24)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Icon(Icons.account_circle, size: 100, color: Colors.orange),
            ),
            SizedBox(height: 40),
            Text('Información de Usuario', style: TextStyle(color: Colors.orange, fontSize: 18, fontFamily: 'Cambria')),
            SizedBox(height: 20),
            Text('Usuario: $displayName', style: TextStyle(color: Colors.grey, fontSize: 18, fontFamily: 'Times New Roman')),
            SizedBox(height: 10),
            Text('Correo: $email', style: TextStyle(color: Colors.grey, fontSize: 18, fontFamily: 'Times New Roman')),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Color del botón
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: Text('Cerrar Sesión', style: TextStyle(fontFamily: 'Times New Roman', fontSize: 16, color: Colors.black)),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('images/logo.png', height: 100), // Asegúrate de que la ruta esté correcta
            )
          ],
        ),
      ),
    );
  }
}
