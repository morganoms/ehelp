import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputDropdown<T> extends StatefulWidget {
  InputDropdown({
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.icon,
    this.onSaved,
    this.validator,
    this.value,
    Key? key,
  }) : super(key: key);
  final List<DropdownMenuItem>? items;
  final String hintText;
  final Widget? icon;
  final T? value;
  void Function(dynamic)? onChanged;
  final void Function(dynamic)? onSaved;
  final String? Function(dynamic)? validator;

  @override
  State<InputDropdown> createState() => _InputDropdownState();
}

class _InputDropdownState extends State<InputDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      onSaved: widget.onSaved,
      items: widget.items,
      onChanged: widget.onChanged,
      validator: widget.validator,
      value: widget.value,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Color(0xFF707070), width: 0.5)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.red, width: .5),
        ),
      ),
    );
  }
}
