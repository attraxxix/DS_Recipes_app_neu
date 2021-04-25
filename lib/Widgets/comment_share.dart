import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:recipe_ds/Controllers/recipe_controller.dart';

class BuildCommentShare extends StatelessWidget {
  @required
  final icon;
  @required
  final name;

  BuildCommentShare({Key key, this.icon, this.name}) : super(key: key);

  final RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: recipeController.colorbg.value,
        border: NeumorphicBorder(
          color: Color(0x11000000),
          width: 0.8,
        ),
        depth: 2,
      ),
      child: Container(
        width: 120,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: recipeController.coloracc.value,
              size: 30,
            ),
            SizedBox(height: 2),
            Text(
              name,
              style: TextStyle(
                color: recipeController.coloracc.value,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
