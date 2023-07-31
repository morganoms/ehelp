// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  BackButtonWidget({this.isCancelButton = false, this.onTap, Key? key})
      : super(key: key);
  final bool isCancelButton;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      child: Icon(
        isCancelButton ? Icons.close : Icons.arrow_back_rounded,
        color: Colors.white,
      ),
    );
  }
}
