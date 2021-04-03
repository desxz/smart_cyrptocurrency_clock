import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      ),
      backgroundColor: Color(0xff27303d),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/Logo.svg',
                  color: Colors.white,
                ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 7,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff414954),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
