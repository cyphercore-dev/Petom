import 'package:flutter/material.dart';
import 'package:petom/pages/shared/main_drawer.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = '/wallet';

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  // BackgroundColor
  final Color _BackgroundColor = Color.fromRGBO(72, 73, 161, 1);

  // USD container color
  final Color _color = Colors.pink;
  final Color _color2 = Colors.pink[300];

  Widget _buildTxItem(String type, String amount) {
    final screenWidth = MediaQuery.of(context).size.width;
    final amountUSD = (double.parse(amount) * 2.2).toStringAsFixed(1);

    return Container(
      padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16),
      height: 64,
      width: screenWidth,
      child: Row(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Container(
                  height: 48,
                  width: 48,
                  child: Image(
                      image: AssetImage('assets/images/atom.png'),
                      fit: BoxFit.cover))),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("$type",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 4),
              Text("$amount ATOM",
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          Spacer(),
          Text(
            "+ \$$amountUSD",
            style: TextStyle(
                color: type == "Received" ? Colors.green[500] : Colors.red[500],
                fontSize: 24,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: MainDrawer(),
      body: Stack(
        children: <Widget>[
          // background color
          Positioned(
            child: Container(color: Colors.indigo),
          ),
          // balance
          Positioned(
            top: 20,
            left: 135,
            child: Column(
              children: <Widget>[
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "230",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "ATOM",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ])),
                Text("\$506",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 18)),
              ],
            ),
          ),
          // White Container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.65,
              width: screenWidth,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 35,
                    left: 0,
                    child: Container(
                      height: screenHeight * 0.65 - 20,
                      width: screenWidth,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0))),
                      child: Column(
                        children: <Widget>[
                          ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              SizedBox(height: 40),
                              // list 1
                              _buildTxItem("Received", "20.00308879"),
                              // list 2
                              _buildTxItem("Sent", "12.54609035"),
                              // list 3.
                              _buildTxItem("Sent", "105.25108229"),
                              // list 4.
                              _buildTxItem("Received", "90.12095800"),
                              // list 5.
                              _buildTxItem("Sent", "67.94209812"),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Container(
                              height: 50,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).iconTheme.color,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "More",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // ATOM
                  Positioned(
                    top: 0,
                    left: screenWidth * 0.5 - 70,
                    child: Container(
                      height: 65,
                      width: 140,
                      decoration: BoxDecoration(
                          color: Theme.of(context).iconTheme.color,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                spreadRadius: 2)
                          ]),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 8),
                          Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Icon(Icons.arrow_drop_down,
                                  size: 24,
                                  color: Theme.of(context).iconTheme.color)),
                          SizedBox(width: 15),
                          Text("ATOM",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
