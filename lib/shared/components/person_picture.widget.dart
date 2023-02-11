import 'package:ehelp/shared/colors/constants.dart';
import 'package:flutter/material.dart';

class PersonPicture extends StatelessWidget {
  const PersonPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width / 6,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/person2.jpg',
          ),
        ),
        borderRadius: BorderRadius.circular(15),
        color: ColorConstants.primaryLight,
      ),
    );
  }
}
