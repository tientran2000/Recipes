import 'package:flutter/material.dart';
import 'package:flutter_app/data/recipe_database.dart';
import 'package:flutter_app/models/recipe.api.dart';
import 'package:flutter_app/models/recipe.dart';
import 'package:flutter_app/views/recipe_card.dart';
import 'package:flutter_app/views/recipe_detail.dart';
class Home extends StatefulWidget {
  Home();
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> {
static List<Recipe> list=[];
  List<Recipe> _recipes;
  bool _isLoading = true;
//RecipeHelper _recipeHelper=RecipeHelper();
  //RecipeDatabase _recipeDatabase = RecipeDatabase.instance;
  @override
  void initState() {
    super.initState();
    getRecipes();

  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
list=_recipes;
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      _isLoading
          ? Center(child: CircularProgressIndicator())
          :
      ListView.builder(

              itemCount: list.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetails(
                            recipeModel: list[index],
                          ),
                        ));
                    onSave(list[index].name,list[index].totalTime,
                        list[index].images, list[index].rating);
                  },
                  child: RecipeCard(
                      title: list[index].name,
                      cookTime: list[index].totalTime,
                      rating: list[index].rating.toString(),
                      thumbnailUrl: list[index].images),
                );
              },

            ),
    );
  }

  void onSave(
    String n,
    String t,
    String img,
    double r,
  ) {
    var info = Recipe(name: n, totalTime: t, rating: r, images: img);
    RecipeDatabase.instance.insertRecipe(info);

    // Navigator.pop(context);
  }
}
