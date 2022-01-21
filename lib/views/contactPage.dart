import 'package:flutter/material.dart';


class ContactPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: Image(
                image: AssetImage('assets/image/nguyenlieu.jpg'),
                height: 100,
                width: 150,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: Text(
                'Food Recipes',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.center,
              child: Text(
                'Contact Information',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              height: 20,
              width: 300,
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/image/email.png'),
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    'tranthuytien08062000@gmail.com',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              height: 20,
              width: 300,
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/image/facebook.png'),
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    'https://www.facebook.com/tientien8648',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }


}
