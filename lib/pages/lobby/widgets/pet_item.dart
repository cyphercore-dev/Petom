import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:petom/pages/pet_detail/pet_detail_page.dart';

class PetItem extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;
  final String description;

  PetItem(
      {@required this.id,
      @required this.name,
      @required this.imageUrl,
      @required this.description});

  void selectPet(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      PetDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectPet(context),
      child: Padding(
        padding: EdgeInsets.only(left: 40.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: id,
              child: Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
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
                    name,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.favorite_border),
                      iconSize: 30.0,
                      color: Theme.of(context).iconTheme.color,
                      // TO-DO: use provider to pass data around
                      onPressed: () => {} // toggleFavorite(pet.id),
                      ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12.0, 0.0, 40.0, 12.0),
              child: Text(
                description,
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
