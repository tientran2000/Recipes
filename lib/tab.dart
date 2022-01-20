import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/models/recipe.api.dart';
import 'package:flutter_app/models/recipe.dart';
import 'package:flutter_app/views/categoriesPage.dart';
import 'package:flutter_app/views/home.dart';
import 'package:flutter_app/views/menuPage.dart';
import 'package:flutter_app/views/recipe_card.dart';
import 'package:flutter_app/views/searchPage.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();
  @override
  OnHomeScreenState createState() => OnHomeScreenState();
}

class OnHomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;
  final tabs = [
    Home(),
    OnSearch(),
    CategoryPage(),
    Menu()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kBottomColor.withOpacity(0.1),
          elevation: 0.0,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kDarkGreyFontColor,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            bottomNavigationBarItem("Home", Icon(Icons.home_outlined)),
            bottomNavigationBarItem("Search", Icon(Icons.search_outlined)),
            bottomNavigationBarItem("Category", Icon(Icons.dashboard_outlined)),
            bottomNavigationBarItem("Menu", Icon(Icons.menu_outlined)),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(String s, Icon i) {
    return BottomNavigationBarItem(
      icon: i,
      title: Text(s),
    );
  }
}
