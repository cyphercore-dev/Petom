import 'package:flutter/material.dart';
import 'package:petom/models/owner_model.dart';
import 'package:petom/pages/user_profile/user_profile_page.dart';

class ProfileOverview extends StatelessWidget {
  final Owner owner;

  ProfileOverview(this.owner);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(ProfileScreen.routeName),
      child: Container(
        padding: EdgeInsets.only(left: 40.0, top: 40.0),
        alignment: Alignment.centerLeft,
        child: CircleAvatar(
          child: ClipOval(
            child: Image(
              height: 40.0,
              width: 40.0,
              image: AssetImage(owner.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
