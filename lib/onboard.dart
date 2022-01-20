import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/tab.dart';

class OnBoardScreen extends StatefulWidget{
  OnBoardScreen();
  @override
  OnBroadScreenState createState()=> OnBroadScreenState();
}
class OnBroadScreenState extends State<OnBoardScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/image/cheff.png",height: 300,width: 500,),
              )
            ],
          ),
          Container(
            height: 330,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: 30,
            ),
            padding: EdgeInsets.symmetric(vertical: 35),
            decoration: BoxDecoration(
              color: kDarkColor,
              borderRadius: BorderRadius.circular(45),
            ),
            child: Column(
              children: [
                Text("Simplify your \ncooking plan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: kLightFontColor,
                  fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 30,),
                Text("No more confused about \nyour meal menu",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                      fontSize: 18,
                      color: kDarkGreyFontColor,
                      fontWeight: FontWeight.w400
                  ),),
                SizedBox(height: 55,),
                GestureDetector(
                  onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(),)),
                  child: Container(
                    height: 52,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Let's go",
                      style: TextStyle(
                          fontSize: 20,
                          color: kDarkGreyFontColor,
                          fontWeight: FontWeight.w800
                      )
                  ),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}