import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({this.isCancelButton = false, Key? key})
      : super(key: key);
  final bool isCancelButton;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Icon(
        isCancelButton ? Icons.close : Icons.arrow_back_rounded,
        color: Colors.white,
      ),
    );
  }
}
