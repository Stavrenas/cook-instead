import 'package:cook_instead/domain/feed_element.dart';

class Recipe extends FeedElement {
  List<String> images = [];
  List<String> imagesUrls = [];
  String title = "Recipe title";
  String subtitle = "Recipe subtitle";
  String maintext = "Recipe maintext";
  List<String> ingredients = [];
  String description = "Recipe description";
  DateTime createdAt = DateTime.now();
  String color = "#FFA500";
  List<String> tags = [];

  Recipe(this.images,this.title, this.subtitle, this.maintext, this.ingredients,
      this.description, this.createdAt, this.color, this.tags);

  @override
  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        json['images']
            .map((element) => element.toString())
            .cast<String>()
            .toList(),
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
