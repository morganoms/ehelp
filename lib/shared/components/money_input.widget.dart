import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class MenyInput extends StatefulWidget {
  const MenyInput({
    required this.label,
    this.hintText,
    this.icon,
    this.onChanged,
    this.controller,
    final Key? key,
  }) : super(key: key);
  final String? hintText;
  final Widget? icon;
  final Function? onChanged;
  final Widget? label;
  final MoneyMaskedTextController? controller;

  @override
  State<MenyInput> createState() => _MenyInputState();
}

class _MenyInputState extends State<MenyInput> {
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
          widget.onChanged!(widget.controller!.numberValue);
        }
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        label: widget.label,
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
