import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:recipe_ds/Controllers/recipe_controller.dart';
import 'package:recipe_ds/models/recipe.dart';

class RecipeItemWidget extends StatelessWidget {
  final Recipe recipe;

  RecipeItemWidget({Key key, this.recipe}) : super(key: key);

  final RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/recipe',
            arguments: recipe,
          );
        },
        child: Neumorphic(
          style: NeumorphicStyle(
            border: NeumorphicBorder(
              color: Color(0x11000000),
              width: 0.8,
            ),
            shape: NeumorphicShape.concave,
            depth: -3,
            color: recipeController.colorbg.value,
          ),
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Hero(
                  tag: "imageRecipe" + recipe.title,
                  child: CachedNetworkImage(
                    imageUrl: recipe.imageUrl,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        recipe.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: recipeController.colortxt.value,
                        ),
                      ),
                    ),
                    Text(
                      recipe.user,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
