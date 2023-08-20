import 'package:cook_instead/domain/feed_element.dart';
import 'package:cook_instead/firebase/firebase_options.dart';
import 'package:cook_instead/domain/recipe.dart';
import 'package:cook_instead/domain/info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:convert';

final storage =
    FirebaseStorage.instanceFor(bucket: "gs://cook-instead.appspot.com");


Future<List<Recipe>> readRecipes() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        recipes.add(recipe);
      }
    }
  }
  return recipes;
}

Future<List<Info>> readInfos() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

