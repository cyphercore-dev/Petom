import 'package:flutter/material.dart';
import 'package:petom/dummy_data.dart';
import 'package:petom/pages/user_profile/user_profile_page.dart';
import 'package:petom/providers/pets_provider.dart';
import 'package:provider/provider.dart';

class PetDetailScreen extends StatelessWidget {
  static const routeName = '/pet-detail';

  // final Pet pet;
  // final Function toggleFavorite;
  // final Function isFavorite;

  PetDetailScreen(
      // this.pet,
      // this.toggleFavorite,
      // this.isFavorite
      );

  Widget _buildInfoCard(String label, String info) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 100.0,
      decoration: BoxDecoration(
        color: Color(0xFFF8F2F7),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.indigo,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            info,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final petId = ModalRoute.of(context).settings.arguments as int;
    final selectedPet = DUMMY_PETS.firstWhere((pet) => pet.id == petId);
    // --- !!! BELOW DOESN'T WORK. NEED FIXING !!! --- //
    // final selectedPet =
    //     Provider.of<Pets>(context, listen: false).findById(petId);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: selectedPet.id,
                  child: Container(
                    width: double.infinity,
                    height: 350.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          selectedPet.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 10.0),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      selectedPet.name,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                          // isFavorite(selectedPet.id)
                          //     ? Icons.favorite
                          //     : Icons.favorite_border,
                          Icons.favorite_border),
                      iconSize: 30.0,
                      color: Theme.of(context).iconTheme.color,
                      onPressed: () => {}, // toggleFavorite(selectedPet.id)),
                    )
                  ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                selectedPet.description,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16.0,
                  // color: Colors.grey,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              height: 120.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(width: 30.0),
                  _buildInfoCard('Age', selectedPet.age.toString()),
                  _buildInfoCard('Sex', selectedPet.sex),
                  _buildInfoCard('Color', selectedPet.color),
                  _buildInfoCard('ID', selectedPet.id.toString()),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, top: 30.0),
              width: double.infinity,
              height: 90.0,
              decoration: BoxDecoration(
                color: Color(0xFFFFF2D0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 8.0,
                ),
                leading: GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(ProfileScreen.routeName),
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image(
                        height: 40.0,
                        width: 40.0,
                        image: AssetImage(DUMMY_OWNER.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  DUMMY_OWNER.name,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                subtitle: Text(
                  'Owner',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                  ),
                ),
                trailing: Text(
                  '1.68 km',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
              child: Text(
                DUMMY_OWNER.bio,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                    width: 60.0,
                    child: IconButton(
                      onPressed: () => print('Share'),
                      icon: Icon(Icons.share),
                    ),
                  ),
                  FlatButton.icon(
                    padding: EdgeInsets.all(
                      20.0,
                    ),
                    color: Theme.of(context).iconTheme.color,
                    onPressed: () => print('Adopt'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    icon: Icon(
                      Icons.pets,
                      color: Colors.white,
                    ),
                    label: Text(
                      'ADOPTION',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
