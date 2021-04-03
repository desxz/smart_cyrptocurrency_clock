import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff27303d),
        elevation: 0,
        leading: Icon(Icons.ac_unit),
      ),
      backgroundColor: Color(0xff27303d),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.ac_unit),
              Text(
                'CRYPTO\nCURRENCY',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Form(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 33, horizontal: 18),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff414954),
                  border: Border.all(
                      color: Colors.transparent, // set border color
                      width: 3.0), // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 0, left: 10),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter something...',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
