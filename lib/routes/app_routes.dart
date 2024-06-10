import 'package:corealingo/src/account/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:corealingo/routes/routes.dart';

//acount
import 'package:corealingo/src/account/login.dart';
import 'package:corealingo/src/account/register.dart';
import 'package:corealingo/src/account/usuario.dart';
//home
import 'package:corealingo/main.dart';
//pages
import 'package:corealingo/src/pages/first.dart';
import 'package:corealingo/src/pages/introduccion.dart';
import 'package:corealingo/src/pages/introduccion_b.dart';
import 'package:corealingo/src/pages/introduccion_c.dart';
import 'package:corealingo/src/pages/introduccion_d.dart';
import 'package:corealingo/src/pages/introduccion_e.dart';







Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.login: (_) => LoginPage(),
  Routes.register: (_) => RegisterPage(),
  Routes.forgotPassword: (_) => ForgotPasswordPage(),
};

// También asegúrate de definir la ruta en tu clase `Routes`
class Routes {
  Routes._();

  static const String login = "/login";
  static const String register = "/register";
  static const String forgotPassword = "/forgotPassword";
}