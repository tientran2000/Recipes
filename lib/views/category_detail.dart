import 'package:flutter/material.dart';
import 'package:flutter_app/models/recipe.api.dart';
import 'package:flutter_app/models/recipe.dart';
import 'package:flutter_app/views/recipe_card.dart';
import 'package:flutter_app/views/recipe_detail.dart';

class Categories extends StatefulWidget {
  String name_cate;
  Categories({
    @required this.name_cate,
  });
  @override
  CategoriesPage createState() => CategoriesPage();
}

class CategoriesPage extends State<Categories> {
  bool _isLoading = true;
  List<Recipe> _recipes;
  List<Recipe> recipe_category=[];
  @override
  void initState() {
    super.initState();
    getRecipes();
     //gan();

    //print(widget.name_cate);
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    for (var i in _recipes) {
    setState(() {
      _isLoading = false;
        if (i.tags_course == widget.name_cate) {
          recipe_category.add(i);
          print(i);
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: recipe_category.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetails(
                          recipeModel: recipe_category[index],
                        ),
                      )),
                  child: RecipeCard(
                      title: recipe_category[index].name,
                      cookTime: recipe_category[index].totalTime,
                      rating: recipe_category[index].rating.toString(),
                      thumbnailUrl: recipe_category[index].images),
                );
              },
            ),
    );
  }
}

