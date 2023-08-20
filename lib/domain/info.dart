import 'package:cook_instead/domain/feed_element.dart';

class Info extends FeedElement {
  List<String> images = [];
  List<String> imagesUrls = [];
  String description = "Info description";
  DateTime createdAt = DateTime.now();
  List<String> tags = [];

  Info(this.description, this.createdAt, this.tags);

  @override
  factory Info.fromJson(dynamic json) {
    return Info(
        json['description'] as String,
        DateTime.parse(json['createdAt'] as String),
        json['tags'].map((element) => element as String).toList());
  }
}
