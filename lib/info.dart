class Info{
  List<String> images = [];
  String description = "Info description";
  DateTime createdAt = DateTime.now();
  List<String> tags = [];

  Info(this.description, this.createdAt, this.tags);

  factory Info.fromJson(dynamic json){
    return Info(
      json['description'] as String,
      DateTime.parse(json['createdAt'] as String),
      json['tags'].map((element) => element as String).toList()
    );
  }
}
