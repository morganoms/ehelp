import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GenericLoading extends StatefulWidget {
  const GenericLoading({Key? key}) : super(key: key);

  @override
  State<GenericLoading> createState() => _GenericLoadingState();
}

class _GenericLoadingState extends State<GenericLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animations/v-3-black.json', height: 100),
      ),
    );
  }
}
