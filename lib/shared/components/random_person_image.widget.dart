import 'dart:math';

import 'package:ehelp/shared/colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class RandomPersonImage extends StatelessWidget {
  const RandomPersonImage({
    this.heightImage = 75,
    this.indexImage = 3,
    required this.widthtImage,
    this.marginRight = true,
    Key? key,
  }) : super(key: key);
  final double heightImage;
  final double widthtImage;
  final bool marginRight;
  final int indexImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightImage,
      margin: EdgeInsets.only(right: marginRight ? 16 : 0),
      width: widthtImage,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorConstants.primaryLight,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/person$indexImage.jpg',
          ),
        ),
      ),
    );
  }
}
