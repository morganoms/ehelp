import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ehelp/core/locator.dart';
import 'package:ehelp/shared/components/default_dialog.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../shared/entity/speciality.entity.dart';
import '../../view_model/controllers/home_client.view_model.dart';
import 'adress_dialog.widget.dart';

// ignore: must_be_immutable
class DropdownSearchWidget extends StatelessWidget {
  DropdownSearchWidget({
    required this.items,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  final List<String> items;
  final HomeClientViewModel _controller = locator.get<HomeClientViewModel>();
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Text(
            'Procurar serviço',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor,
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: _controller.serviceSelected,
          onChanged: (value) {
            _controller.setServiceSelected(value as SpecialityEntity);

            showDialog(
                context: context,
                builder: (builder) =>
                    const DefaultDialog(child: AdressDialogWidget()));
          },
          buttonPadding: const EdgeInsets.only(right: 16),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              width: 0.5,
            ),
          ),
          icon: const Icon(Icons.keyboard_arrow_down),
          itemHeight: 40,
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
      ),
    );
  }
}
