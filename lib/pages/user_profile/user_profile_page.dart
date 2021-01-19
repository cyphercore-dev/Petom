import 'package:flutter/material.dart';
import 'package:petom/pages/shared/main_drawer.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String content1 = "I do what I do.";
  String content2 = "I am who I am.";

  Widget _buildStatsColumn(String fieldName, String amount) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("$fieldName".toUpperCase(),
              style: TextStyle(
                color: Theme.of(context).iconTheme.color, //Colors.indigo,
                fontSize: 14.0,
                fontFamily: 'Montserrat',
                //fontWeight: FontWeight.bold,
              )),
          Text("$amount\K",
              style: TextStyle(
                color: Theme.of(context).iconTheme.color, //Colors.indigo,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //  appBar: AppBar(
      //    title: Text('Profile'),
      //  ),
      drawer: MainDrawer(),
      body: Stack(
        children: <Widget>[
          // background
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: screenHeight * 0.2,
              child: ClipPath(
                  clipper: myClipper(),
                  child: Image(
                      image: AssetImage('assets/images/profile.jpg'),
                      fit: BoxFit.cover))),

          // stats
          Positioned(
            top: 10,
            left: 24,
            right: 24,
            child: Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildStatsColumn("followers", "3.2"),
                  _buildStatsColumn("posts", "1.8"),
                  _buildStatsColumn("following", "5.7"),
                ],
              ),
            ),
          ),

          // White container
          Positioned(
              bottom: 0,
              left: 90,
              right: 90,
              child: Container(
                height: screenHeight * 0.29,
//                color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Text("Corona Virus",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Theme.of(context).iconTheme.color,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.location_on, size: 12.0),
                        Text("California, USA",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'Montserrat',
                            ))
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(18.0)),
                          child: Center(
                              child: Text("FOLLOW".toUpperCase(),
                                  style: TextStyle(
                                      color: Theme.of(context).iconTheme.color,
                                      fontFamily: 'Montserrat',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold))),
                        ),
                        SizedBox(width: 16),
                        Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 0.7),
                              color: Theme.of(context).iconTheme.color,
                              borderRadius: BorderRadius.circular(18.0)),
                          child: Center(
                              child: Text("Message".toUpperCase(),
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      fontFamily: 'Montserrat',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold))),
                        )
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Text(content1,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Montserrat',
                        )),
                    Text(content2,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Montserrat',
                        )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class myClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height * 0.90);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.80, size.width, size.height * 0.90);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
