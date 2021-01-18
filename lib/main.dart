import 'package:flutter/material.dart';
import 'package:petom/dummy_data.dart';
import 'package:petom/pages/login/login_page.dart';
import 'package:petom/pages/login/widgets/tabs.dart';
import 'package:petom/pages/wallet/wallet_page.dart';
import 'package:petom/pages/user_profile/user_profile_page.dart';
import 'package:petom/pages/pet_detail/pet_detail_page.dart';
import './models/pet_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: Color(0xFFFD6456),
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Montserrat',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: HomeScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => LoginScreen(), //TabsScreen(_favoritePets),
        TabsScreen.routeName: (ctx) => TabsScreen(DUMMY_PETS),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        WalletScreen.routeName: (ctx) => WalletScreen(),
        PetDetailScreen.routeName: (ctx) =>
            PetDetailScreen(_toggleFavorite, _isPetFavorite),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            // builder: (ctx) => HomeScreen(),
            );
      },
    );
  }
}
