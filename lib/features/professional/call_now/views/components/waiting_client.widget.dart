import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class WaitingClientWidget extends StatelessWidget {
  const WaitingClientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Text('Aguarde confirmaçao do cliente'),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
