import 'package:flutter/material.dart';

class DefaultDialog extends StatelessWidget {
  const DefaultDialog({
    required this.child,
    final Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(final BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        child: child,
      );
}
