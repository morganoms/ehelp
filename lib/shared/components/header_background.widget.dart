import 'package:flutter/material.dart';

import '../colors/constants.dart';

class HeaderBackground extends StatelessWidget {
  const HeaderBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          stops: [0, 0.5],
          colors: [ColorConstants.primaryV2, Colors.white],
        ),
      ),
    );
  }
}
