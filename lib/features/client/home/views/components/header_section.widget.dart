import 'package:flutter/material.dart';

class HeaderSectionWidget extends StatelessWidget {
  const HeaderSectionWidget({required this.title, Key? key}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.black.withOpacity(0.2),
          height: 1,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          color: Colors.white,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
