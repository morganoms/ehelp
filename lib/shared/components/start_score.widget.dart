import 'package:flutter/material.dart';

import '../fonts/styles.dart';

class StarScore extends StatelessWidget {
  const StarScore({this.value, Key? key}) : super(key: key);

  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(
          Icons.star_border_outlined,
          color: Colors.yellow.shade700,
        ),
        Text(value.toString(), style: FontStyles.size14Weight700),
      ]),
    );
  }
}
