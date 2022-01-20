import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';

class CategoryCard extends StatelessWidget {
  final String title;

  CategoryCard({
   
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 10,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kDarkColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "$title",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: kLightFontColor,
        ),
      ),
    );
  }
}
