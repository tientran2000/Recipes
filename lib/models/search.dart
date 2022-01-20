class Search {
  final String name;
  Search({ this.name});

  factory Search.fromJson(dynamic json) {
    return Search(
        name: json
        as String);
  }
  static List<Search> searchFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Search.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Search {name: $name}';
  }
}