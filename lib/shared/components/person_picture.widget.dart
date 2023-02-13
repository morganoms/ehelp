import 'package:ehelp/shared/colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PersonPicture extends StatelessWidget {
  const PersonPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width / 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorConstants.primaryLight,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
          fit: BoxFit.cover,
          image: const AssetImage(
            'assets/images/person5.jpg',
          ),
        ),
      ),
    );
  }
}
