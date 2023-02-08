// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({
    required this.label,
    this.hintText,
    this.icon,
    this.onChanged,
    this.maxLines = 1,
    this.controller,
    this.borderRadius,
    final Key? key,
  }) : super(key: key);
  final String? hintText;
  final Widget? icon;
  final Function? onChanged;
  final Widget? label;
  final BorderRadius? borderRadius;
  final int maxLines;
  final TextEditingController? controller;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  FocusNode? _inputFocusNode;

  @override
  void initState() {
    _inputFocusNode = FocusNode();
    _inputFocusNode!.addListener(_onFocusNodeEvent);
    super.initState();
  }

  void _onFocusNodeEvent() {
    setState(() => {});
  }

  @override
  void dispose() {
    _inputFocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: (final dynamic val) {
        if (widget.onChanged != null) {
          widget.onChanged!(double.parse(val));
        }
      },
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        alignLabelWithHint: widget.maxLines > 1 ? true : false,
        label: widget.label,
        contentPadding: EdgeInsets.symmetric(
            horizontal: 24, vertical: widget.maxLines > 1 ? 24 : 0),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(50),
            borderSide: const BorderSide(color: Color(0xFF707070), width: 0.5)),
        errorBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.red, width: .5),
        ),
      ),
    );
  }
}
