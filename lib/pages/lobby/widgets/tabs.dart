import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:petom/pages/lobby/widgets/change_theme_buttom.dart';
import 'package:petom/pages/shared/main_drawer.dart';
import 'package:petom/pages/lobby/lobby_page.dart';
import 'package:petom/pages/user_profile/user_profile_page.dart';
import 'package:petom/pages/favourite/favs_page.dart';
import 'package:petom/models/pet_model.dart';
import 'package:petom/pages/wallet/wallet_page.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';

  final List<Pet> favoritePets;
  TabsScreen(this.favoritePets);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 1;

  @override
  void initState() {
    _pages = [
      {
        'page': ProfileScreen(),
        'title': 'Profile',
      },
      {
        'page': LobbyScreen(),
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
