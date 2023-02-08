import 'package:flutter/material.dart';

class PersonPicture extends StatelessWidget {
  const PersonPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      // margin: const EdgeInsets.only(top: 24),
      // alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFF575757),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: SizedBox.expand(
          child: FittedBox(
            child: Icon(
              Icons.person_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
