import 'package:flutter/material.dart';
import 'package:petom/providers/pets_provider.dart';
import 'package:provider/provider.dart';
import './widgets/location.dart';
import './widgets/filter.dart';
import 'widgets/pets_list.dart';

class LobbyScreen extends StatelessWidget {
  static const routeName = '/lobby';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Pets(),
      child: ListView(
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
          PetsList(),
          // PetItem(DUMMY_PETS[0].id, DUMMY_PETS[0].name, DUMMY_PETS[0].imageUrl, DUMMY_PETS[0].description),
        ],
      ),
    );
  }
}
