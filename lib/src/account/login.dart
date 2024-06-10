import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:corealingo/src/account/register.dart';
import 'package:corealingo/src/pages/first.dart'; // Página que muestra después de un inicio de sesión exitoso

import 'package:corealingo/main.dart';








import 'package:corealingo/src/account/forgot_password.dart'; // Asegúrate de tener esta página creada

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (userCredential.user != null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SecondPage()));
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al iniciar sesión: ${e.message}'))
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error desconocido: $e'))
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.deepPurple.shade300, Colors.red.shade200],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Center(
                child: Image.asset('images/logoz.png', height: 200),
              ),
            ),
            Flexible(
              flex: 4,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Correo',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          fillColor: const Color.fromARGB(255, 236, 149, 220).withOpacity(0.8),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Introduce un correo.';
                          }
                          if (!value.contains('@')) {
                            return 'Introduzca un correo válido.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          fillColor: Color.fromARGB(255, 236, 149, 220).withOpacity(0.8),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Introduzca una contraseña.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          disabledForegroundColor: Colors.purple[300]!.withOpacity(0.38), disabledBackgroundColor: Colors.purple[300]?.withOpacity(0.12),
                          shadowColor: const Color.fromARGB(255, 222, 220, 226),
                          elevation: 15,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        child: Text('Ingresar'),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => ForgotPasswordPage()));
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white70,
                          textStyle: TextStyle(fontSize: 16, decoration: TextDecoration.underline),
                        ),
                        child: Text('¿Olvidaste tu contraseña?'),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => RegisterPage()));
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white70, textStyle: TextStyle(fontSize: 16, decoration: TextDecoration.underline),
                        ),
                        child: Text('¿Aún no tienes una Cuenta? Regístrate'),
                      ),
                    ],
                  ),
                ),
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
    _passwordController.dispose();
    super.dispose();
  }
}
