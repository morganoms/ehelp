import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  const GenericButton({
    required this.label,
    final Key? key,
    this.height,
    this.width,
    this.labelStyle,
    required this.onPressed,
    this.color,
    this.borderColor,
  }) : super(key: key);
  final Color? color;
  final Color? borderColor;
  final double? width;
  final void Function()? onPressed;
  final double? height;
  final String label;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: color ?? const Color(0xFF575757),
        shadowColor: Colors.transparent.withOpacity(0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        height: height ?? 50,
        width: width ?? double.maxFinite,
        child: Text(
          label,
          style: labelStyle ??
              const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}
