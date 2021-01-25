import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:petom/models/pet_model.dart';
import 'package:petom/pages/pet_detail/pet_detail_page.dart';
import 'package:provider/provider.dart';

class PetItem extends StatelessWidget {
  void viewPetDetail(BuildContext context, Pet pet) {
    Navigator.of(context)
        .pushNamed(
      PetDetailScreen.routeName,
      arguments: pet.id,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pet = Provider.of<Pet>(context, listen: false);

    return GestureDetector(
      onTap: () => viewPetDetail(context, pet),
      child: Padding(
        padding: EdgeInsets.only(left: 40.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: pet.id,
              child: Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(pet.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12.0, 10.0, 40.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    pet.name,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Consumer<Pet>(
                    builder: (ctx, pet, _) => IconButton(
                        icon: Icon(pet.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border),
                        iconSize: 30.0,
                        color: Theme.of(context).iconTheme.color,
                        onPressed: () => {pet.toggleFavoriteStatus()}),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12.0, 0.0, 40.0, 12.0),
              child: Text(
                pet.description,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
