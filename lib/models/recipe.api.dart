import 'dart:convert';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/models/recipe.dart';
import 'package:flutter_app/models/search.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    // var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
    //     {"limit": "18", "start": "0", "tag": "list.recipe.popular"});
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list-similarities',
        {"limit": "18", "start": "0", "id": '15-Minute-Baked-Salmon-with-Lemon-9029477',
          "apiFeedType": 'moreFrom',
          "authorId": 'Yummly'});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "aa66d34497msha00c0b506da1911p1c723fjsn0cccd222151d",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
     // _temp.add(i['content']['details']);
      _temp.add(i['content']);
    }
//print(_temp);
    return Recipe.recipesFromSnapshot(_temp);
  }

  static Future<List<Category>> getCategory() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/tags/list'
    );

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "aa66d34497msha00c0b506da1911p1c723fjsn0cccd222151d",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });
    Map data = jsonDecode(response.body);
    List _temp = [];

    try {
      for (var i in data['en-US']['course']) {
        _temp.add(i);
      }
     // print(_temp);
    } catch (Exception) {
      print("lỗi");
    }
    return Category.categoriesFromSnapshot(_temp);
  }
  static Future<List<Search>> getRecipeSearch() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/auto-complete',
        {
          "q": 'chicken soup',
        });

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "aa66d34497msha00c0b506da1911p1c723fjsn0cccd222151d",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",

    });
    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['searches']) {
      // _temp.add(i['content']['details']);
      _temp.add(i);
    }
print(_temp);
    return Search.searchFromSnapshot(_temp);
  }
}
