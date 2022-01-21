import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/views/contactPage.dart';
import 'package:flutter_app/views/favoritePage.dart';
import 'package:flutter_app/views/historyPage.dart';

class Menu extends StatefulWidget {
  Menu();
  @override
  MenuPage createState() => MenuPage();
}

class MenuPage extends State<Menu> {


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      padding: EdgeInsets.only(top:50,bottom: 150,left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  child: Image.asset('assets/image/cheff.png',height: 100,width: 100,),
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Miroslava Savitskaya',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),

          Expanded(
            child: ListView(
              children: <Widget>[

                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('History'),
                  onTap: (){
                    Navigator.push(context,
                             MaterialPageRoute(builder: (_) => History()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Favorite'),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Favorite()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Contact'),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ContactPage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share'),
                  onTap: (){
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => Lienhe()));
                  },
                ),

                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Exit'),
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Exit'
                          ),
                          content: Text(
                            'Do you want to exit the app',
                            style:
                            TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          actions: [
                            OutlineButton(
                              onPressed: (){SystemNavigator.pop();},
                              child: Text('Exit'),
                            )
                          ],
                        );
                      },
                    );},
                )
              ],
            ),
          ),





        ],
      ),

    );
  }
}