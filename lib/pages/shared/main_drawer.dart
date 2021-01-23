import 'package:flutter/material.dart';
import 'package:petom/pages/login/login_page.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, Color iconColor, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: iconColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Montserrat',
          // color: Theme.of(context).iconTheme.color,
          fontSize: 24,
          // fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).iconTheme.color;

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
              color: Theme.of(context).iconTheme.color,
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
          // buildListTile('Lobby', Icons.pets, iconColor, () {
          //   Navigator.of(context).pushNamed(LobbyScreen.routeName);
          // }),
          buildListTile('Logout', Icons.lock_outline, iconColor, () {
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          }),
        ],
      ),
    );
  }
}
