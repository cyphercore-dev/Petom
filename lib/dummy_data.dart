import 'package:petom/models/pet_model.dart';
import 'package:petom/models/owner_model.dart';
import 'package:petom/models/breed_model.dart';

const DUMMY_BREEDS = const [
  Breed(
    id: 'c8',
    name: 'Labrador',
  ),
  Breed(
    id: 'c9',
    name: 'French Bulldog',
  ),
];

const DUMMY_OWNER = const Owner(
    name: 'Corona Virus',
    imageUrl: 'assets/images/profile.jpg',
    bio:
        'I recently got laid off and ended up having to move into a place that doesn\'t allow pets. Looking for someone that can give my dog the best life possible.');

const DUMMY_PETS = const [
  Pet(
    owner: DUMMY_OWNER,
    name: 'Katherine',
    imageUrl: 'assets/images/golden.jpeg',
    description: 'Golden Retriever',
    age: 1,
    sex: 'Female',
    color: 'Light Golden',
    id: 12345,
  ),
  Pet(
    owner: DUMMY_OWNER,
    name: 'Darlene',
    imageUrl: 'assets/images/labrador.jpeg',
    description: 'Labrador',
    age: 1,
    sex: 'Female',
    color: 'Yellow',
    id: 98765,
  ),
  Pet(
    owner: DUMMY_OWNER,
    name: 'Bella',
    imageUrl: 'assets/images/bella.jpg',
    description: 'Pitbull',
    age: 5,
    sex: 'Female',
    color: 'brindle',
    id: 10145,
  ),
  Pet(
    owner: DUMMY_OWNER,
    name: 'Oliver',
    imageUrl: 'assets/images/beagle.jpg',
    description: 'Labrador retriever puppy',
    age: 1,
    sex: 'Male',
    color: 'Chocolate Tri',
    id: 98764,
  ),
];
