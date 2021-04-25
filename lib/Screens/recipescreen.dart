import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:recipe_ds/Controllers/recipe_controller.dart';
import 'package:recipe_ds/Widgets/com_sha_section.dart';
import 'package:recipe_ds/Widgets/descriptionsection.dart';
import 'package:recipe_ds/Widgets/image_section.dart';
import 'package:recipe_ds/Widgets/recipe_title.dart';
import 'package:recipe_ds/models/recipe.dart';

class RecipeScreen extends StatelessWidget {
  final Recipe recipe;
  

  final recipeController = Get.put(RecipeController());

  RecipeScreen({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
String title = recipe.title;

    return Obx(() => Scaffold(
          backgroundColor: recipeController.colorbg.value,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      title =="Mes recettes"
                      ?Container(height: 60, width: 60)
                      :NeumorphicButton(
                          margin: EdgeInsets.all(8.0),
                          onPressed: () {
                            Get.back();
                          },
                          style: NeumorphicStyle(
                            border: NeumorphicBorder(
                              color: Color(0x11000000),
                              width: 0.8,
                            ),
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.circle(),
                            depth: 2,
                            color: recipeController.colorbg.value,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: recipeController.colortxt.value,
                            ),
                          )),
                      Text(
                        recipe.title,
                        style: TextStyle(
                          color: recipeController.coloracc.value,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      title != "Mes recettes"
                      ?Container(height: 60, width: 60)
                      :NeumorphicButton(
                        margin: EdgeInsets.all(8.0),
                        onPressed: () {
                          recipeController.isDark.value
                              ? recipeController.isDark.value = false
                              : recipeController.isDark.value = true;
                          recipeController.setColor();
                        },
                        style: NeumorphicStyle(
                          border: NeumorphicBorder(
                            color: Color(0x11000000),
                            width: 0.8,
                          ),
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.circle(),
                          depth: 2,
                          color: recipeController.colorbg.value,
                        ),
                        child: Center(
                          child: recipeController.isDark.value
                              ? Icon(
                                  Icons.wb_sunny_outlined,
                                  color: recipeController.colortxt.value,
                                )
                              : Icon(
                                  Icons.nightlight_round,
                                  color: recipeController.colortxt.value,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ImageSection(title:recipe.title , imageurl: recipe.imageUrl),
                      RecipeTitle(
                          title: recipe.title,
                          user: recipe.user,
                          imageurl: recipe.imageUrl,
                          description: recipe.description,
                          isfavorite: recipe.isFavorite,
                          favoritecount: recipe.favoriteCount),
                      ComShaSection(),
                      DescrptionSection(
                        description: recipe.description,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
