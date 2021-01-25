import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:petom/pages/home/widgets/bottom_navbar.dart';
import 'package:petom/pages/home/widgets/change_theme_buttom.dart';
import 'package:petom/pages/home/widgets/curved_nav_bar.dart';
import 'package:petom/pages/shared/main_drawer.dart';
import 'package:petom/pages/lobby/lobby_page.dart';
import 'package:petom/pages/user_profile/user_profile_page.dart';
import 'package:petom/pages/favourite/favs_page.dart';
import 'package:petom/models/pet_model.dart';
import 'package:petom/pages/wallet/wallet_page.dart';

enum AppBarFilters {
  Favourites,
  All,
  Settings,
  Logout,
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  // final List<Pet> favoritePets;
  // HomeScreen(this.favoritePets);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 1;
  var _showFavsOnly = false;

  @override
  void initState() {
    _pages = [
      {
        'page': ProfileScreen(),
        'title': 'Profile',
      },
      {
        'page': Lobby(_showFavsOnly),
        'title': 'Lobby',
      },
      {
        'page': Text("Fav Screen"), // FavoritesScreen(widget.favoritePets),
        'title': 'Your Favorites',
      },
      {
        'page': WalletScreen(),
        'title': 'Wallet',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        title: Text(_pages[_selectedPageIndex]['title'],
            style: TextStyle(
              color: Theme.of(context).iconTheme.color,
            )),
        elevation: 0,
        actions: [
          ChangeThemeButtonWidget(),
          PopupMenuButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onSelected: (AppBarFilters selectedValue) {
              setState(() {
                if (selectedValue == AppBarFilters.Favourites) {
                  _showFavsOnly = true;
                } else if (selectedValue == AppBarFilters.All) {
                  _showFavsOnly = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.favorite,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text("Favs Only"),
                  ),
                  value: AppBarFilters.Favourites),
              PopupMenuItem(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.favorite_border,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text("All"),
                  ),
                  value: AppBarFilters.All),
              PopupMenuItem(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.settings,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text("Settings"),
                  ),
                  value: AppBarFilters.Settings),
              PopupMenuItem(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.logout,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text("Log Out"),
                  ),
                  value: AppBarFilters.Logout),
            ],
          )
        ],
      ),
      drawer: MainDrawer(),
      // this doesn't work; consider changing the page switching mechanism
      // body: _pages[_selectedPageIndex]['page'],
      // this works
      body: Lobby(_showFavsOnly),
      bottomNavigationBar: BottomNavBar(_selectedPageIndex, _selectPage),
      // bottomNavigationBar: CurvedNavBar(_selectPage)),
    );
  }
}
