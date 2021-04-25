import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:recipe_ds/Controllers/recipe_controller.dart';

class DescrptionSection extends StatelessWidget {

  final description;

  DescrptionSection({Key key, this.description}) : super(key: key);

  final RecipeController recipeController = Get.put(RecipeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Neumorphic(
        
        style: NeumorphicStyle(
          color: recipeController.colorbg.value,
          border: NeumorphicBorder(
            color: Color(0x11000000),
            width: 1.5,
          ),
          depth: 2,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: 600,
            child: Text(
              description,
              style: TextStyle(
                  color: recipeController.colortxt.value,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
