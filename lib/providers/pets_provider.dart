import 'package:flutter/material.dart';
import 'package:petom/dummy_data.dart';
import 'package:petom/models/pet_model.dart';

class Pets with ChangeNotifier {
  List<Pet> _pets = DUMMY_PETS;

  List<Pet> get pets {
    return [..._pets]; // return a copy
  }

  void addPet() {
    notifyListeners();
  }
}
