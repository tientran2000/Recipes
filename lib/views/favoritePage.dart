import 'package:flutter/material.dart';
import 'package:flutter_app/data/recipe_database.dart';
import 'package:flutter_app/models/recipe.api.dart';
import 'package:flutter_app/models/recipe.dart';
import 'package:flutter_app/views/recipe_card.dart';
import 'package:flutter_app/views/recipe_detail.dart';

class Favorite extends StatefulWidget {
  Favorite();
  @override
  FavoritePage createState() => FavoritePage();
}

class FavoritePage extends State<Favorite> {
  List<Recipe> _recipes;
  bool _isLoading = true;
  List<Recipe> _list;
  List<Recipe> _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Recipe>>(
          future: RecipeDatabase.instance.readAllFavorite(),
          builder: (BuildContext context, AsyncSnapshot<List<Recipe>> rec) {
            if (!rec.hasData) {
              // print(rec);
              print(rec.data);
              return Center(child: Text('Loading...'));
            }
            print('page');

            //print(rec.data);
            print('o');
            return rec.data?.isEmpty
                ? Center(child: Text('No Recipes in List.'))
                : ListView(
              children: rec.data?.map((grocery) {
                return Center(
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetails(
                            recipeModel: grocery,
                          ),
                        )),
                    child: RecipeCard(
                        title: grocery.name,
                        cookTime: grocery.totalTime,
                        rating: grocery.rating.toString(),
                        thumbnailUrl: grocery.images),
                    onLongPress: () {
                      setState(() {
                        RecipeDatabase.instance.deletefavorite(grocery.name);
                      });
                    },
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
