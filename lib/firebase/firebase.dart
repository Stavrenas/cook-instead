import 'dart:collection';

import 'package:cook_instead/domain/recipe.dart';
import 'package:cook_instead/domain/info.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:convert';

final storage =
    FirebaseStorage.instanceFor(bucket: "gs://cook-instead.appspot.com");

Future<List<Recipe>> readRecipes() async {
  List<Recipe> recipes = [];
  final recipeFolders = await storage.ref().child("recipes").listAll();
  for (var folder in recipeFolders.prefixes) {
    var files = await folder.listAll();
    for (var file in files.items) {
      if (file.name.contains(RegExp(r'^[^\\\/:*?"<>|]+\.json$'))) {
        var filedata = await file.getData();
        if (filedata == null) {
          continue;
        }

        final recipeJson = utf8.decode(filedata);
        final recipeDynamic = jsonDecode(recipeJson);
        final recipe = Recipe.fromJson(recipeDynamic);
        final HashMap<String, String> imageMap = HashMap();
        //parse image urls from recipe image names
        final imageUrls = <String>[];
        for (var image in files.items) {
          for (var name in recipe.images) {
            if (image.name == name) {
              final imageUrl = await image.getDownloadURL();
              imageMap.putIfAbsent(image.name, () => imageUrl);
            }
          }
        }
        // Get urls from map to keep the same order as in recipe.images
        for (var name in recipe.images) {
          imageUrls.add(imageMap[name]!);
        }
        recipe.imagesUrls = imageUrls;
        recipes.add(recipe);
      }
    }
  }
  return recipes;
}

Future<List<Info>> readInfos() async {
  List<Info> infos = [];
  final listResult = await storage.ref().child("didyouknow").listAll();
  for (var folder in listResult.prefixes) {
    var files = await folder.listAll();
    for (var file in files.items) {
      if (file.name.contains(RegExp(r'^[^\\\/:*?"<>|]+\.json$'))) {
        var filedata = await file.getData();
        if (filedata == null) {
          continue;
        }
        final infoJson = utf8.decode(filedata);
        infos.add(Info.fromJson(jsonDecode(infoJson)));
      }
    }
  }
  return infos;
}

// TODO: finish generic function attempt

// Future<List<T>> readElements<T extends FeedElement>(String folder) async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   List<T> elements = [];
//   final listResult = await storage.ref().child(folder).listAll();
//   for (var folder in listResult.prefixes) {
//     var files = await folder.listAll();
//     for (var file in files.items) {
//       if (file.name.contains(RegExp(r'^[^\\\/:*?"<>|]+\.json$'))) {
//         var filedata = await file.getData();
//         if (filedata == null) {
//           continue;
//         }
//         final elementJson = utf8.decode(filedata);
//         elements.add(T.fromJson(jsonDecode(elementJson)));
//       }
//     }
//   }
//   return elements;
// }
