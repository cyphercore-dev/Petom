import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 22.0,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Icon(
              Icons.add_location,
              color: Theme.of(context).iconTheme.color,
              size: 40.0,
            ),
          ),
          labelText: 'Location',
          labelStyle: TextStyle(
            fontSize: 20.0,
            color: Theme.of(context).iconTheme.color,
          ),
          // contentPadding: EdgeInsets.only(bottom: 20.0),
        ),
      ),
    );
  }
}
