import 'package:cook_instead/firebase_options.dart';
import 'package:cook_instead/recipe.dart';
import 'package:cook_instead/info.dart';
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
        if(filedata == null){
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
        if(filedata == null){
          continue;
        }
        final infoJson = utf8.decode(filedata);
        infos.add(Info.fromJson(jsonDecode(infoJson)));
      }
    }
  }
  return infos;
}
