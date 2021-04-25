import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:recipe_ds/Controllers/recipe_controller.dart';
import 'package:recipe_ds/models/recipe.dart';

class RecipeTitle extends StatelessWidget {
  final title;
  final user;
  final imageurl;
  final description;
  final isfavorite;
  final favoritecount;

  Recipe recipe; 

  final recipeController = Get.put(RecipeController());

  RecipeTitle(
      {Key key, this.title, this.user, this.imageurl, this.description,this.isfavorite, this.favoritecount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    recipeController.isFavorite.value = isfavorite;
    recipeController.favoriteCount.value = favoritecount;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Neumorphic(
        style: NeumorphicStyle(
          border: NeumorphicBorder(
            color: Color(0x11000000),
            width: 0.8,
          ),
          shape: NeumorphicShape.concave,
          depth: -2,
          color: recipeController.colorbg.value,
        ),
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: recipeController.colortxt.value,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Obx(() => NeumorphicButton(
                        onPressed: () {
                          
                          recipeController.seticon(isfavorite, favoritecount, Recipe(title,  user, imageurl,  description,  isfavorite,  favoritecount,));
                          
                        },
                        style: NeumorphicStyle(
                          color: recipeController.colorbg.value,
                          border: NeumorphicBorder(
                            color: Color(0x11000000),
                            width: 0.8,
                          ),
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.circle(),
                          depth: 2,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              recipeController.isFavorite.value == true
                                  ? Icon(Icons.favorite_outlined,
                                      color: Colors.red)
                                  : Icon(
                                      Icons.favorite_border_outlined,
                                      color: recipeController.colortxt.value,
                                    ),
                              SizedBox(width: 2),
                              Text(
                                  recipeController.favoriteCount.value
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: recipeController.colortxt.value,
                                  )),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
