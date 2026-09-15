import 'package:flutter/material.dart';

import '../Screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff29384D),

      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/imeges.png",
              width: 150,
              height: 150,
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Image.asset(
                "assets/images/bc633c130c6133f154761730443a8c96f70622fe.gif",
                width: 500,
                height: 400,
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 600),
              child: Text(
                "There is No Contacts Added Here",
                style: TextStyle(
                  color: Color(0xffFFF1D4),
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffFFF1D4),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Screen(),
              ),
            );
          },
            child: Icon(Icons.add,)
            ),
    );
  }
}