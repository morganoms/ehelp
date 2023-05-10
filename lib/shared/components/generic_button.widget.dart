import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GenericButton extends StatelessWidget {
  const GenericButton({
    required this.label,
    final Key? key,
    this.height,
    this.width,
    this.labelStyle,
    this.error = false,
    this.loading = false,
    this.success = false,
    required this.onPressed,
    this.color,
    this.borderColor,
  }) : super(key: key);
  final Color? color;
  final Color? borderColor;
  final bool success;
  final bool loading;
  final bool error;
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
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: _buildButtonContent(context));
  }

  Widget _buildButtonContent(final BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState:
          loading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 100),
      firstChild: Center(
        child: SizedBox(
          child: Lottie.asset('assets/animations/v-3.json', height: 50),
        ),
      ),
      secondChild: Container(
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
