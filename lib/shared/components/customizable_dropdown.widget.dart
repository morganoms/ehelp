import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomizableDropdown extends StatefulWidget {
  const CustomizableDropdown({
    required this.items,
    final Key? key,
    this.label = '',
    this.controller,
    this.value,
    this.focusNode,
    this.keyboardType,
    this.autofocus = false,
    this.obscureText = false,
    this.readOnly = false,
    this.disabled = false,
    this.leadingIcon,
    this.onTapLeadingIcon,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.labelStyle,
    this.style,
  }) : super(key: key);
  final String label;
  final TextEditingController? controller;
  final String? value;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool autofocus;
  final bool obscureText;
  final bool readOnly;
  final bool disabled;
  final IconData? leadingIcon;
  final Function()? onTapLeadingIcon;
  final void Function(String?)? onChanged;
  final Function()? onTap;
  final Function(PointerDownEvent)? onTapOutside;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onSaved;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final List<String> items;

  @override
  State<CustomizableDropdown> createState() => _CustomizableDropdownState();
}

class _CustomizableDropdownState extends State<CustomizableDropdown> {
  FocusNode? _inputFocusNode;

  @override
  void initState() {
    _inputFocusNode = widget.focusNode ?? FocusNode();
    _inputFocusNode!.addListener(_onFocusNodeEvent);
    super.initState();
  }

  void _onFocusNodeEvent() {
    setState(() => <dynamic>{});
  }

  @override
  void dispose() {
    _inputFocusNode!.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(final CustomizableDropdown oldWidget) {
    if (oldWidget.disabled != widget.disabled) {
      setState(() => <dynamic>{});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(final BuildContext context) => Opacity(
        opacity: widget.disabled ? 0.4 : 1,
        child: Stack(children: <Widget>[
          AbsorbPointer(
            absorbing: widget.disabled,
            child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(
                  vertical: _inputFocusNode?.hasFocus ?? false ? 3 : 4,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.grey,
                        width: _inputFocusNode?.hasFocus ?? false ? 2 : 1)),
                child: Theme(
                  data: ThemeData(canvasColor: Colors.white),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                          value: widget.value,
                          isExpanded: true,
                          focusNode: _inputFocusNode,
                          autofocus: widget.autofocus,

                          // dropdownStyleData: DropdownStyleData(
                          //   maxHeight: 200,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(12),
                          //   ),
                          //   elevation: 4,
                          //   direction: DropdownDirection.left,
                          //   isOverButton: true,
                          // ),
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: _inputFocusNode?.hasFocus ?? false
                                  ? FontWeight.w500
                                  : FontWeight.w400),
                          onChanged: widget.disabled
                              ? (final _) {}
                              : widget.onChanged,
                          items: widget.items
                              .map<DropdownMenuItem<String>>(
                                  (final String value) =>
                                      DropdownMenuItem<String>(
                                          value: value, child: Text(value)))
                              .toList())),
                )),
          ),
          if (widget.label != '')
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.only(left: 12),
                color: Colors.white,
                child: Text(widget.label,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)))
        ]),
      );
}
