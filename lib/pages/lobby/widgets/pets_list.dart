import 'package:flutter/material.dart';
import 'package:petom/dummy_data.dart';
import 'package:petom/providers/pets_provider.dart';
import 'package:provider/provider.dart';
import 'pet_item.dart';

class PetsList extends StatelessWidget {
  // const PetsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final petsData = Provider.of<Pets>(context);
    final pets = petsData.pets;

    return Container(
      height: 450,
      child: ListView(
        padding: const EdgeInsets.only(left: 5, top: 20),
        children: pets
            .map(
              (data) => ChangeNotifierProvider(
                create: (context) => data,
                child: PetItem(
                    // id: data.id,
                    // name: data.name,
                    // breed: data.breed,
                    // imageUrl: data.imageUrl,
                    // description: data.description,
                    ),
              ),
            )
            .toList(),
        scrollDirection: Axis.vertical,
        //shrinkWrap: true,
      ),
    );
  }
}
