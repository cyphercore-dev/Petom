import 'package:flutter/material.dart';
import 'package:petom/dummy_data.dart';
import 'package:petom/providers/pets_provider.dart';
import 'package:provider/provider.dart';
import './pet_item.dart';

class PetList extends StatelessWidget {
  const PetList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final petData = Provider.of<Pets>(context);
    final pets = petData.pets;

    return Container(
      height: 450,
      child: ListView(
        padding: const EdgeInsets.only(left: 5, top: 20),
        children: pets
            .map(
              (data) => PetItem(
                id: data.id,
                name: data.name,
                breed: data.breed,
                imageUrl: data.imageUrl,
                description: data.description,
              ),
            )
            .toList(),
        scrollDirection: Axis.vertical,
        //shrinkWrap: true,
      ),
    );
  }
}
