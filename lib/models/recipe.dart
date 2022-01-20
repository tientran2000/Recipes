class Recipe {
  String name;
  String images;
  double rating;
  String totalTime;
  List<dynamic> preparationSteps;
  List<dynamic> ingredientLines;
  // List<dynamic> tags_course;
  final String tags_course;
  List<dynamic> keywords;
  Recipe(
      {this.name,
      this.images,
      this.rating,
      this.totalTime,
      this.preparationSteps,
      this.ingredientLines,
      this.tags_course,
      this.keywords});

  factory Recipe.fromJson(dynamic json) {
    List<dynamic> tmpingredient = [];
    for (var i in json['ingredientLines']) {
      tmpingredient.add(i['wholeLine']);
    }
     String tmp = json['tags']['course'][0]['display-name'] ;
    if (tmp!=null){
      tmp=json['tags']['course'][0]['display-name'];
    }else
    {
        tmp="orther";
    }
    String n = json['details']['name'] as String;
   // print(tmp);
   // print(n);
    return Recipe(
        //name: json['details']['name'] as String,
        name: n,
        images: json['details']['images'][0]['hostedLargeUrl'] as String,
        rating: json['details']['rating'] as double,
        totalTime: json['details']['totalTime'] as String,
        preparationSteps: json['preparationSteps'] as List,
        ingredientLines: tmpingredient,
        tags_course: tmp,
        keywords: json['details']['keywords'] as List
        // tags_course: json['tags']['course'][0]['display-name']!=null?json['tags']['course'][0]['display-name']:null as String,
        );
  }
  factory Recipe.fromMap(Map<String,dynamic> j)=> new Recipe(
    name: j['name'],
    images:j['image'] ,
    rating: j['rating'],
    totalTime:j['time'] ,
  );
  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }
  Map<String, dynamic> toMap() => {

    "name": name,
    "image": images,
    "rating": rating,
    "time": totalTime,
  };
  Map<String, dynamic> keytoMap()=>{
    "keywords":List<dynamic>.from(keywords.map((x) => x.toJson())),
  };
  Map<String, dynamic> ingredienttoMap()=>{
    "ingredientLines":List<dynamic>.from(ingredientLines.map((x) => x.toJson())),
  };
  Map<String, dynamic> steptoMap()=>{
    "preparationSteps":List<dynamic>.from(preparationSteps.map((x) => x.toJson())),
  };
  @override
  String toString() {
    // return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime,preparationstep: $preparationSteps,ingredientLines: $ingredientLines'
        ',tag: $tags_course'
        '}';
  }



}

