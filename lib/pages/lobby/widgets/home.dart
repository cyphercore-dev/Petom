import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:petom/pages/lobby/widgets/change_theme_buttom.dart';
import 'package:petom/pages/shared/main_drawer.dart';
import 'package:petom/pages/lobby/lobby_page.dart';
import 'package:petom/pages/user_profile/user_profile_page.dart';
import 'package:petom/pages/favourite/favs_page.dart';
import 'package:petom/models/pet_model.dart';
import 'package:petom/pages/wallet/wallet_page.dart';

enum AppBarFilters {
  Favourites,
  All,
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  final List<Pet> favoritePets;
  HomeScreen(this.favoritePets);

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
        'page': LobbyScreen(_showFavsOnly),
        'title': 'Lobby',
      },
      {
        'page': FavoritesScreen(widget.favoritePets),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                    value: AppBarFilters.All),
                PopupMenuItem(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.logout,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      title: Text("Log Out"),
                    ),
                    value: AppBarFilters.All),
              ],
            )
          ],
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        // bottomNavigationBar: BottomNavigationBar(
        //   onTap: _selectPage,
        //   backgroundColor: Theme.of(context).primaryColor,
        //   unselectedItemColor: Colors.white,
        //   selectedItemColor: Theme.of(context).accentColor,
        //   currentIndex: _selectedPageIndex,
        //   type: BottomNavigationBarType.fixed,
        //   items: [
        //     BottomNavigationBarItem(
        //       backgroundColor: Theme.of(context).primaryColor,
        //       icon: Icon(Icons.category),
        //       title: Text('Lobby'),
        //     ),
        //     BottomNavigationBarItem(
        //       backgroundColor: Theme.of(context).primaryColor,
        //       icon: Icon(Icons.star),
        //       title: Text('Favorites'),
        //     ),
        //   ],
        // ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          buttonBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          height: 50,
          items: <Widget>[
            Icon(
              Icons.chat_bubble,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
            Icon(
              Icons.house,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
            Icon(
              Icons.star,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
            Icon(
              Icons.account_balance_wallet,
              size: 25,
              color: Theme.of(context).iconTheme.color,
            ),
          ],
          index: 1,
          animationDuration: Duration(milliseconds: 200),
          animationCurve: Curves.bounceInOut,
          onTap: _selectPage,
        ));
  }
}
