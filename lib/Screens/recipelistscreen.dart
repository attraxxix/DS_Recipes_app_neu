import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:recipe_ds/Controllers/recipe_controller.dart';
import 'package:recipe_ds/Widgets/recipeitem.dart';
import 'package:recipe_ds/database/recipebox.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  

  final recipeController = Get.put(RecipeController());

  @override
  void initState() {
    super.initState();
    recipeController.setColor();
  }

  @override
  Widget build(BuildContext context) {
    String title = "Mes recettes";

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
                      title == "Mes recettes"
                          ? Container(height: 60, width: 60)
                          : NeumorphicButton(
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
                        title,
                        style: TextStyle(
                          color: recipeController.coloracc.value,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      title != "Mes recettes"
                          ? Container(height: 60, width: 60)
                          : NeumorphicButton(
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
                  child: ValueListenableBuilder(
                    valueListenable: RecipeBox.box.listenable(),
                    builder: (context, Box items, _){
                      List<String> keys = items.keys.cast<String>().toList();
                      return ListView.builder(
                    itemCount: keys.length,
                    itemBuilder: (context, index) {
                      final recipe = items.get(keys[index]);
                      return Dismissible(
                        background: Container(color: Colors.red),
                        key: Key(recipe.title),
                        onDismissed: (direction) {
                          setState(() {
                            RecipeBox.box.delete(recipe.key());
                          });
                        },
                        child: RecipeItemWidget(
                          recipe: recipe,
                        ),
                      );
                    },
                  );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
