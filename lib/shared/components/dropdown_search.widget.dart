// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';

class DropdownSearch2Widget<T> extends StatelessWidget {
  DropdownSearch2Widget({
    required this.textEditingController,
    this.initValue,
    required this.hintText,
    required this.onChanged,
    required this.items,
    Key? key,
  }) : super(key: key);

  final T? initValue;
  final String hintText;
  void Function(Object?)? onChanged;
  final TextEditingController textEditingController;
  final List<DropdownMenuItem<T>> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: true,
        hint: Text(hintText, style: FontStyles.size16Weight700),
        items: items,
        value: initValue,
        style: FontStyles.size16Weight700black,
        onChanged: onChanged,
        buttonPadding: const EdgeInsets.only(right: 16),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorConstants.whiteBackground,
        ),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        itemHeight: 40,
        buttonHeight: 60,
        dropdownMaxHeight: 200,
        searchController: textEditingController,
        searchInnerWidget: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 4,
            right: 8,
            left: 8,
          ),
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              hintText: 'Buscar...',
              hintStyle: const TextStyle(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        searchMatchFn: (item, searchValue) {
          final String a = item.value.toString().toLowerCase();
          final String b = searchValue.toLowerCase();
          return a.contains(b);
        },
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}
