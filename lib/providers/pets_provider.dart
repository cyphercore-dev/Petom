import 'package:flutter/material.dart';
import 'package:petom/dummy_data.dart';
import 'package:petom/models/pet_model.dart';

class Pets with ChangeNotifier {
  List<Pet> _pets = DUMMY_PETS;

  List<Pet> get pets {
    return [..._pets]; // return a copy
  }

  Pet findById(int id) {
    return _pets.firstWhere((pet) => pet.id == id);
  }

  void addPet() {
    notifyListeners();
  }
}
