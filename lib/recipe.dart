class Recipe {
  List<String> images = [];
  String title = "Recipe title";
  String subtitle = "Recipe subtitle";
  String maintext = "Recipe maintext";
  List<String> ingredients = [];
  String description = "Recipe description";
  DateTime createdAt = DateTime.now();
  String color = "#FFA500";
  List<String> tags = [];

  Recipe(this.title, this.subtitle, this.maintext, this.ingredients,
      this.description, this.createdAt, this.color, this.tags);

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        json['title'] as String,
        json['subtitle'] as String,
        json['maintext'] as String,
        json['ingredients']
            .map((element) => element.toString())
            .cast<String>()
            .toList(),
        json['description'] as String,
        DateTime.parse(json['createdAt'] as String),
        json['color'] as String,
        json['tags']
            .map((element) => element.toString())
            .cast<String>()
            .toList());
  }
}
