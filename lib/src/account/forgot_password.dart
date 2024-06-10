import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _resetPassword() async {
    // Verifica que el campo del correo no esté vacío y contenga un '@'
    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, introduce un correo electrónico válido.')),
      );
      return;
    }

    try {
      // Intenta enviar un correo de restablecimiento
      await _auth.sendPasswordResetEmail(email: _emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correo de restablecimiento enviado. Revisa tu correo.')),
      );
      Navigator.of(context).pop(); // Opcional: regresar al login después de enviar el correo
    } on FirebaseAuthException catch (e) {
      // Manejo específico del error 'user-not-found'
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No existe una cuenta con ese correo electrónico.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al enviar correo: ${e.message}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al enviar correo: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restablecer contraseña'),
        backgroundColor: Colors.deepPurple.shade300, // Color del AppBar
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.deepPurple.shade300, Colors.red.shade200],
          ),
        ),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.asset('images/logo.png', height: 150), // Asegúrate de que esta ruta es correcta
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                prefixIcon: Icon(Icons.email, color: Colors.white),
                border: OutlineInputBorder(),
                fillColor: Colors.white.withOpacity(0.8),
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _resetPassword,
              icon: Icon(Icons.send),
              label: Text('Enviar correo de restablecimiento'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Color de fondo del botón
                foregroundColor: Colors.white, // Color del texto y el ícono
                minimumSize: Size(double.infinity, 50), // Tamaño mínimo del botón
                elevation: 5, // Elevación del botón
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Forma del botón
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
