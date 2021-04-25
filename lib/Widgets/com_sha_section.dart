import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:recipe_ds/Controllers/recipe_controller.dart';
import 'package:recipe_ds/Widgets/comment_share.dart';

class ComShaSection extends StatelessWidget {
  
  final RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
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
          color: recipeController.isDark.value?Color(0xff333333):Color(0xffeeeeee),
        ),
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BuildCommentShare(icon: Icons.messenger_outline_sharp,name: "Comment",),
              BuildCommentShare(icon: Icons.share,name: "Share",),
            ],
          ),
        ),
      ),
    );
  }
}
