import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedPageIndex;
  final Function selectPage;
  BottomNavBar(this.selectedPageIndex, this.selectPage);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: selectPage,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // unselectedItemColor: Colors.white,
      selectedItemColor: Theme.of(context).iconTheme.color,
      currentIndex: selectedPageIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          //backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          //backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.house),
          label: 'Lobby',
        ),
        BottomNavigationBarItem(
          //backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.favorite),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          //backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.account_balance_wallet),
          label: 'Wallet',
        ),
      ],
    );
  }
}
