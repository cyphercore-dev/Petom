import 'package:flutter/material.dart';
import 'package:petom/pages/wallet/wallet_page.dart';
import 'package:petom/pages/login/login_page.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.indigo,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.black87,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            // color: Theme.of(context).primaryColor,
            // child: Text(
            //   'Petom',
            //   style: TextStyle(
            //       fontWeight: FontWeight.w900,
            //       fontSize: 30,
            //       color: Theme.of(context).accentColor),
            // ),
            decoration: new BoxDecoration(
              color: Theme.of(context).primaryColor,
              image: DecorationImage(
                image: new AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
              // shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // buildListTile('Lobby', Icons.pets, () {
          //   Navigator.of(context).pushNamed(TabsScreen.routeName);
          // }),
          // buildListTile('Profile', Icons.person, () {
          //   Navigator.of(context).pushNamed(ProfileScreen.routeName);
          // }),
          buildListTile('Wallet', Icons.account_balance_wallet, () {
            Navigator.of(context).pushNamed(WalletScreen.routeName);
          }),
          buildListTile('Logout', Icons.lock_outline, () {
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          }),
        ],
      ),
    );
  }
}
