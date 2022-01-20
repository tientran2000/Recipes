class Category {
  final String name;
  Category({ this.name});

  factory Category.fromJson(dynamic json) {
    return Category(
        name: json['name'] as String);
  }
  static List<Category> categoriesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Category.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Category {name: $name}';
  }
}