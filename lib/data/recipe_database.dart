import 'dart:io';

import 'package:flutter_app/models/recipe.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class RecipeDatabase {
  RecipeDatabase._init();
  static final RecipeDatabase instance = RecipeDatabase._init();

  static Database _database;
  final String tablename = 'recipe';
  final String name = 'name';
  final String image = 'image';
  final String rating = 'rating';
  final String time = 'time';

  final String tags = 'tag';

final String table='favorite';
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('recipe.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    Directory dbPath=await getApplicationDocumentsDirectory();
    //final dbPath = await getDatabasesPath();
    print(dbPath);
    String path = join(dbPath.path, filePath);
    print(path);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'TEXT PRIMARY KEY';

    await db.execute('''
  CREATE TABLE $tablename ( 
  $name $idType, 
   $image text not null,
          $rating double,
          $time text not null
  );
  
''');
    await db.execute('''CREATE TABLE $table ( 
  $name $idType, 
   $image text not null,
          $rating double,
          $time text not null
  );''');
  }
  Future<int> insertFavorite(Recipe note) async {
    Database db = await instance.database;

    return await db.insert(table, note.toMap());
  }
  Future<int> insertRecipe(Recipe note) async {
    Database db = await instance.database;

    return await db.insert(tablename, note.toMap());
  }

  Future<List<Recipe>> readAllRecipe() async {
    Database db = await instance.database;
    var groceries = await db.query(tablename, orderBy: 'name');
    List<Recipe> groceryList = groceries.isNotEmpty
        ? groceries.map((c) => Recipe.fromMap(c)).toList()
        :[];

    return groceryList;
  }
  Future<List<Recipe>> readAllFavorite() async {
    Database db = await instance.database;
    var groceries = await db.query(table, orderBy: 'name');
    List<Recipe> groceryList = groceries.isNotEmpty
        ? groceries.map((c) => Recipe.fromMap(c)).toList()
        :[];

    return groceryList;
  }

  Future<int> delete(String id) async {
    final db = await instance.database;

    return await db.delete(
      tablename,
      where: 'name = ?',
      whereArgs: [id],
    );
  }
  Future<int> deletefavorite(String id) async {
    final db = await instance.database;

    return await db.delete(
      table,
      where: 'name = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
