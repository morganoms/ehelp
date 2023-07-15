import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GenericError extends StatelessWidget {
  const GenericError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('error'),
      ),
    );
  }
}
