import 'package:flutter/material.dart';
import 'package:petom/dummy_data.dart';
import 'package:petom/pages/login/login_page.dart';
import 'package:petom/pages/lobby/widgets/tabs.dart';
import 'package:petom/pages/wallet/wallet_page.dart';
import 'package:petom/pages/user_profile/user_profile_page.dart';
import 'package:petom/pages/pet_detail/pet_detail_page.dart';
import 'package:provider/provider.dart';
import './models/pet_model.dart';
import 'providers/theme_provider.dart';

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
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          title: 'Petom',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
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
      });
}
