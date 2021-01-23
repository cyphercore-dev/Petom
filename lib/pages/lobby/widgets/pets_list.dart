import 'package:flutter/material.dart';
import 'package:petom/providers/pets_provider.dart';
import 'package:provider/provider.dart';
import 'pet_item.dart';

class PetsList extends StatelessWidget {
  // const PetsList({Key key}) : super(key: key);
  final bool showFavsOnly;
  PetsList(this.showFavsOnly);

  @override
  Widget build(BuildContext context) {
    final petsData = Provider.of<Pets>(context);
    final pets = showFavsOnly ? petsData.favPets : petsData.pets;

    return Container(
      height: 450,
      child: ListView(
        padding: const EdgeInsets.only(left: 5, top: 20),
        children: pets
            .map(
              // use ChangeNotifierProvider.value + value
              // on existing pbjects
              (data) => ChangeNotifierProvider.value(
                value: data,
                child: PetItem(),
              ),
            )
            .toList(),
        scrollDirection: Axis.vertical,
        //shrinkWrap: true,
      ),
    );
  }
}
