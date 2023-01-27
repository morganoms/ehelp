import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputDropdown extends StatefulWidget {
  InputDropdown({
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.icon,
    Key? key,
  }) : super(key: key);
  final List<String> items;
  final String hintText;
  final Widget? icon;
  void Function(String?)? onChanged;

  @override
  State<InputDropdown> createState() => _InputDropdownState();
}

class _InputDropdownState extends State<InputDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      items: widget.items.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: widget.onChanged,
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
