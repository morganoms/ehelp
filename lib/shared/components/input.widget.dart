import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({
    required this.hintText,
    this.icon,
    final Key? key,
  }) : super(key: key);
  final String hintText;
  final Widget? icon;

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
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Color(0xFF707070), width: 0.5)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.red, width: .5),
        ),
      ),
    );
  }
}
