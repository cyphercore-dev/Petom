import 'package:flutter/material.dart';
import 'package:petom/dummy_data.dart';
import './pet_item.dart';

class PetList extends StatelessWidget {
  const PetList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      child: ListView(
        padding: const EdgeInsets.only(left: 5, top: 20),
        children: DUMMY_PETS
            .map(
              (breedtData) => PetItem(
                id: breedtData.id,
                name: breedtData.name,
                imageUrl: breedtData.imageUrl,
                description: breedtData.description,
              ),
            )
            .toList(),
        scrollDirection: Axis.vertical,
        //shrinkWrap: true,
      ),
    );
  }
}
