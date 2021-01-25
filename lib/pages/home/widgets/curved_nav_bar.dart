import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedNavBar extends StatelessWidget {
  final Function selectPage;
  CurvedNavBar(this.selectPage);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
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
      onTap: selectPage,
    );
  }
}
