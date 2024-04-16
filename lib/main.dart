import 'package:flutter/material.dart';
import 'TelaPrincipal.dart';
import 'TelaInvestimento.dart';
import 'LoginCadastro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Inicia na tela de login/cadastro
      home: LoginCadastro(),
      routes: {
        '/tela_principal': (context) => TelaPrincipal(),
        '/tela_investimento': (context) => TelaInvestimento(),
      },
    );
  }
}
