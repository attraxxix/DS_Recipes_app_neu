import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_ds/database/recipebox.dart';
import 'package:recipe_ds/models/recipe.dart';

class RecipeController extends GetxController {
  var isFavorite = false.obs;
  var favoriteCount = 0.obs;
  var isDark = true.obs;

  var colorbg = Color(0xff333333).obs;
  var colortxt = Color(0x00000000).obs;
  var coloracc = Color(0x00000000).obs;

  setColor() {
    if (isDark.value == false) {
      colorbg.value = Color(0xffeeeeee);
      colortxt.value = Colors.black;
      coloracc.value = Colors.blue[500];
    } else {
      colorbg.value = Color(0xff333333);
      colortxt.value = Colors.white;
      coloracc.value = Colors.blue[500];
    }
  }

  void seticon(isfavorite, favoritecount, recipe) {
    isFavorite.value = !isFavorite.value;

    if (isFavorite.value == true) {
      favoriteCount.value++;
    } else {
      favoriteCount.value--;
    }
    print(recipe.key().toString());
    RecipeBox.box.put(
        recipe.key(),
        Recipe(recipe.title, recipe.user, recipe.imageUrl, recipe.description,
            isFavorite.value, favoriteCount.value));
  }
}
