import 'package:flutter/material.dart';
import 'package:pokeapp/page/homepage.dart';
import 'package:pokeapp/utils/style.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokeapp',
      theme: pikachuTheme,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Pokedex'),
          ),
          body: const HomePage()),
    );
  }
}
