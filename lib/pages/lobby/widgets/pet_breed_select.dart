import 'package:flutter/material.dart';

class PetBreedSelect extends StatelessWidget {
  const PetBreedSelect({
    Key key,
    @required this.context,
    @required this.isSelected,
    @required this.category,
  }) : super(key: key);

  final BuildContext context;
  final bool isSelected;
  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {}, // print('Selected $category'),
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: 80.0,
        decoration: BoxDecoration(
          // color: isSelected ? Color(0xFFFED8D3) : null,
          borderRadius: BorderRadius.circular(20.0),
          border: isSelected
              ? Border.all(
                  width: 4.0,
                  color:
                      Theme.of(context).iconTheme.color, // Color(0xFFFED8D3),
                )
              : null,
        ),
        child: Container(
          child: Row(
            children: <Widget>[
              Flexible(
                child: Center(
                  child: Text(
                    category,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color:
                          isSelected ? Theme.of(context).iconTheme.color : null,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
