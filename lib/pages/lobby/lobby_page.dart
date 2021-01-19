import 'package:flutter/material.dart';
import 'package:petom/providers/theme_provider.dart';
import './widgets/location.dart';
import './widgets/filter.dart';
import './widgets/pet_list.dart';

class LobbyScreen extends StatelessWidget {
  static const routeName = '/lobby';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // ProfileOverview(DUMMY_OWNER),
        // SizedBox(height: 30.0),
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
