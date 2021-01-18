import 'package:flutter/material.dart';
import './pet_breed_select.dart';

class Filter extends StatelessWidget {
  const Filter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(width: 40.0),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () => {}, //print('Filters'),
              icon: Icon(
                Icons.search,
                size: 35.0,
              ),
            ),
          ),
          PetBreedSelect(context: context, isSelected: true, category: 'All'),
          PetBreedSelect(
              context: context, isSelected: false, category: 'Labrador'),
          PetBreedSelect(
              context: context, isSelected: false, category: 'French Bulldog'),
          PetBreedSelect(
              context: context, isSelected: false, category: 'Other'),
        ],
      ),
    );
  }
}
