import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ImageSection extends StatelessWidget {
  final title;
  final imageurl;

  const ImageSection({Key key, this.title,this.imageurl}) : super(key: key);

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
          depth: 2,
        ),
        child: Hero(
          tag: "imageRecipe" + title,
          child: CachedNetworkImage(
            imageUrl: imageurl,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
