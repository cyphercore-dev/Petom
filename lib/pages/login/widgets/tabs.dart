import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:petom/pages/shared/main_drawer.dart';
import 'package:petom/pages/lobby/lobby_page.dart';
import 'package:petom/pages/user_profile/user_profile_page.dart';
import 'package:petom/pages/favourite/favs_page.dart';
import 'package:petom/models/pet_model.dart';

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
          title: Text(_pages[_selectedPageIndex]['title']),
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
          color: Colors.indigo,
          backgroundColor: Color.fromRGBO(255, 254, 229, 1),
          //buttonBackgroundColor: ,
          height: 50,
          items: <Widget>[
            Icon(
              Icons.chat_bubble,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.list,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.star,
              size: 25,
              color: Colors.white,
            ),
          ],
          index: 1,
          animationDuration: Duration(milliseconds: 200),
          animationCurve: Curves.bounceInOut,
          onTap: _selectPage,
        ));
  }
}
