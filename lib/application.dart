import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:petom/dummy_data.dart';
import 'package:petom/routes.dart';
import './models/pet_model.dart';
import 'providers/theme_provider.dart';
import 'dummy_data.dart';
import 'models/pet_model.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  List<Pet> _favoritePets = [];

  void _toggleFavorite(int petId) {
    final existingIndex = _favoritePets.indexWhere((pet) => pet.id == petId);
    if (existingIndex >= 0) {
      setState(() {
        _favoritePets.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritePets.add(
          DUMMY_PETS.firstWhere((pet) => pet.id == petId),
        );
      });
    }
  }

  bool _isPetFavorite(int id) {
    return _favoritePets.any(([pet]) => pet.id == id);
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          title: 'Petom',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          // home: HomeScreen(),
          initialRoute: '/',
          routes: routes,
          navigatorObservers: [routeObserver],
          onUnknownRoute: (settings) {
            // return MaterialPageRoute(
            //     // builder: (ctx) => HomeScreen(),
            //     );
          },
        );
      });
}
