import 'package:ehelp/shared/colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PersonPicture extends StatelessWidget {
  const PersonPicture({this.pathImageNetwork, Key? key}) : super(key: key);
  final String? pathImageNetwork;

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
            image: NetworkImage(pathImageNetwork != null
                ? pathImageNetwork!
                : 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.inspirations.boutique%2Fhome%2Fblank-person-profile%2F&psig=AOvVaw1MFzdFgNef9C9Vy8MqMzYD&ust=1684380443262000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCIiHi6K0-_4CFQAAAAAdAAAAABAE')),
      ),
    );
  }
}
