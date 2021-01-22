import 'package:petom/models/pet_model.dart';
import 'package:petom/models/owner_model.dart';
import 'package:petom/models/breed_model.dart';

const DUMMY_BREEDS = const [
  Breed(
    id: 'c7',
    name: 'Golden Retriever',
  ),
  Breed(
    id: 'c8',
    name: 'Labrador',
  ),
  Breed(
    id: 'c9',
    name: 'French Bulldog',
  ),
  Breed(
    id: 'c10',
    name: 'Pitbull',
  ),
  Breed(
    id: 'c11',
    name: 'Beagle',
  ),
];

const DUMMY_OWNER = const Owner(
    name: 'Corona Virus',
    imageUrl: 'assets/images/profile.jpg',
    bio:
        'I recently got laid off and ended up having to move into a place that doesn\'t allow pets. Looking for someone that can give my dog the best life possible.');

final DUMMY_PETS = [
  Pet(
    owner: DUMMY_OWNER,
    name: 'Katherine',
    breed: DUMMY_BREEDS[0],
    imageUrl: 'assets/images/golden.jpeg',
    description: 'Goofball',
    age: 1,
    sex: 'Female',
    color: 'Light Golden',
    id: 12345,
    isFavourite: false,
  ),
  Pet(
    owner: DUMMY_OWNER,
    name: 'Darlene',
    breed: DUMMY_BREEDS[1],
    imageUrl: 'assets/images/labrador.jpeg',
    description: 'Dealer of hearts',
    age: 1,
    sex: 'Female',
    color: 'Yellow',
    id: 98765,
    isFavourite: false,
  ),
  Pet(
    owner: DUMMY_OWNER,
    name: 'Bella',
    breed: DUMMY_BREEDS[3],
    imageUrl: 'assets/images/bella.jpg',
    description: 'Sassy turkey butt',
    age: 5,
    sex: 'Female',
    color: 'brindle',
    id: 10145,
    isFavourite: false,
  ),
  Pet(
    owner: DUMMY_OWNER,
    name: 'Oliver',
    breed: DUMMY_BREEDS[4],
    imageUrl: 'assets/images/beagle.jpg',
    description: 'Tiny puppy with lots of attitude',
    age: 1,
    sex: 'Male',
    color: 'Chocolate Tri',
    id: 98764,
    isFavourite: false,
  ),
];
