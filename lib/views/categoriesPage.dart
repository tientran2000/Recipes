import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/models/recipe.api.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/views/category_detail.dart';
import 'package:flutter_app/views/categorycard.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage();

  @override
  OnCategoryPage createState() => OnCategoryPage();
}
class OnCategoryPage extends State<CategoryPage>{
  List<Category> _cate;
  bool _isLoading = true;
  @override
  void dispose() {
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    getCategories();
  }

  Future<void> getCategories() async {
    _cate = await RecipeApi.getCategory();
    //RecipeApi.getCategory();
    setState(() {
      _isLoading = false;
    });
    print(_cate);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(

        itemCount: _cate.length,
        itemBuilder: (context, index) {

          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Categories(
                    name_cate:  _cate[index].name,
                  ),
                )),
            child: CategoryCard(
                title: _cate[index].name,
            )

          );
        },
      ),
    );
  }
}