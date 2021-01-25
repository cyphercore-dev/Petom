import 'package:flutter/material.dart';
import 'package:petom/pages/home/home_page.dart';
import 'package:petom/pages/login/login_page.dart';
import 'package:petom/pages/pet_detail/pet_detail_page.dart';
import 'package:petom/pages/user_profile/user_profile_page.dart';
import 'package:petom/pages/wallet/wallet_page.dart';
import 'dummy_data.dart';

final routes = {
  '/': (_) => LoginScreen(),
  HomeScreen.routeName: (_) => HomeScreen(DUMMY_PETS),
  LoginScreen.routeName: (_) => LoginScreen(),
  ProfileScreen.routeName: (_) => ProfileScreen(),
  WalletScreen.routeName: (_) => WalletScreen(),
  PetDetailScreen.routeName: (_) => PetDetailScreen(),
};

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
