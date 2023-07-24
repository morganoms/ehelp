import 'package:flutter/material.dart';

class WaitingClientWidget extends StatelessWidget {
  const WaitingClientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text('Aguarde confirmaçao do cliente'),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
