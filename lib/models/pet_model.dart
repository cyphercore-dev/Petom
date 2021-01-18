import 'package:petom/models/owner_model.dart';
import 'package:flutter/foundation.dart';

class Pet {
  final Owner owner;
  final String name;
  final String imageUrl;
  final String description;
  final int age;
  final String sex;
  final String color;
  final int id;

  const Pet({
    @required this.owner,
    @required this.name,
    @required this.imageUrl,
    @required this.description,
    @required this.age,
    @required this.sex,
    @required this.color,
    @required this.id,
  });
}
