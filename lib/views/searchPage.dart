import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/recipe_database.dart';
import 'package:flutter_app/models/recipe.api.dart';
import 'package:flutter_app/models/recipe.dart';
import 'package:flutter_app/views/recipe_card.dart';
import 'package:flutter_app/views/recipe_detail.dart';

class OnSearch extends StatefulWidget {
  OnSearch();
  @override
  SearchPage createState() => SearchPage();
}

class SearchPage extends State<OnSearch> {
  //var ctrl = new TextEditingController();
  List<Recipe> _recipes;
  bool _isLoading = true;
  List<Recipe> result = [];  String s;
  List<Recipe> list;

  @override
  void initState() {
    super.initState();
    getRecipes();

  }


  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
      result=_recipes;


    });
  }

  void fillRecipes(String key)  {
   List<Recipe> r=[];
   if(key.isEmpty){
     r=_recipes;
   }else{
     for (int i = 0; i < _recipes.length; i++) {
       print(_recipes[i].keywords);
       for (var g in _recipes[i].keywords) {
           if (g.toString().toLowerCase()==(key.toLowerCase())) {
             r.add(_recipes[i]);
           }
       }
     }
   }
   setState(() {
     result=r;
   });
  }

  @override
  Widget build(BuildContext context) {
   // getList(s);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            //controller: ctrl,
            onChanged: (v) {
              fillRecipes(v);

            },
            decoration: const InputDecoration(
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
            ),

          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child:
            result.isNotEmpty
                ?  ListView.builder(

                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeDetails(
                                  recipeModel: _recipes[index],
                                ),
                              ));
                          onSave(_recipes[index].name, _recipes[index].totalTime,
                              _recipes[index].images, _recipes[index].rating);
                        },

                        child: RecipeCard(
                            title: result[index].name,
                            cookTime:result[index].totalTime,
                            rating: result[index].rating.toString(),
                            thumbnailUrl: result[index].images),
                      );
                    },
                  ):
                Text(
                  'No result'
                )
          )
        ],
      ),
    ));
  }
  void onSave(
      String n,
      String t,
      String img,
      double r,
      ) {
    var alarmInfo = Recipe(name: n, totalTime: t, rating: r, images: img);
    RecipeDatabase.instance.insertRecipe(alarmInfo);

    // Navigator.pop(context);
  }
}
