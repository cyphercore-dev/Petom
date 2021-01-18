import 'package:flutter/material.dart';
import './widgets/location.dart';
import './widgets/filter.dart';
import './widgets/user_profile_overview.dart';
import './widgets/pet_list.dart';
import 'package:petom/dummy_data.dart';

class LobbyScreen extends StatelessWidget {
  static const routeName = '/lobby';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ProfileOverview(DUMMY_OWNER),
        SizedBox(height: 30.0),
        Location(),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
        //   child: Divider(),
        // ),
        Filter(),
        SizedBox(height: 10.0),
        PetList(),
        // PetItem(DUMMY_PETS[0].id, DUMMY_PETS[0].name, DUMMY_PETS[0].imageUrl, DUMMY_PETS[0].description),
      ],
    );
  }
}
