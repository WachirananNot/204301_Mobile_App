import 'my_bottom_navigation.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPokemonApp extends StatefulWidget {
  const MyPokemonApp({super.key});

  @override
  State<MyPokemonApp> createState() => _MyPokemonAppState();
}

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) =>
        PokemonService(), //     <----create pokemon service since the start of the app
    child: const MyPokemonApp(),
  ));
}

class _MyPokemonAppState extends State<MyPokemonApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
      return MaterialApp(
        title: 'Pokemon Demo',
        theme: ThemeData(
          primarySwatch:
              pokemonService.class_ == "" //If no Pokemon has been selected yet
                  ? Colors.blue
                  : pokemonService.changeTheme(),
        ),
        home: const MyBottomNavigation(),
      );
    });
  }
}
