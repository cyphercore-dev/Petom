import 'package:flutter/material.dart';
import 'package:petom/models/pet_model.dart';
import '../lobby/widgets/pet/pet_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Pet> favoritePets;

  FavoritesScreen(this.favoritePets);

  @override
  Widget build(BuildContext context) {
    if (favoritePets.isEmpty) {
      return Center(
        child: Text(
          'You have no favorites yet - start adding some!',
          style: TextStyle(color: Theme.of(context).iconTheme.color),
        ),
      );
    } else {
      return ListView.builder(
        padding: const EdgeInsets.only(left: 5, top: 20),
        itemBuilder: (ctx, index) {
          return PetItem(
              // id: favoritePets[index].id,
              // name: favoritePets[index].name,
              // imageUrl: favoritePets[index].imageUrl,
              // description: favoritePets[index].description,
              );
        },
        itemCount: favoritePets.length,
      );
    }
  }
}
