import 'package:ehelp/features/professional/areas/models/working_hours.entity.dart';
import 'package:ehelp/shared/Colors/constants.dart';
import 'package:flutter/material.dart';

class TimeSelector extends StatelessWidget {
  TimeSelector({
    required this.workHours,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final List<WorkingHours> workHours;
  void Function(int, bool) onPressed;

  Widget _buildButton({
    required WorkingHours item,
    required final BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: ElevatedButton(
        onPressed: () => item.isAvaliable
            ? onPressed.call(
                workHours.indexOf(item),
                !item.selected,
              )
            : null,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: getColor(
            isSelected: item.selected,
            isAvaliable: item.isAvaliable,
          ),
          shadowColor: Colors.transparent.withOpacity(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 45,
          width: MediaQuery.of(context).size.width / 5,
          child: Text(
            item.hourName,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Color getColor({
    required final bool isSelected,
    required final bool isAvaliable,
  }) {
    if (isAvaliable) {
      if (isSelected) {
        return ColorConstants.blueSelected;
      } else {
        return ColorConstants.greenAvailable;
      }
    } else {
      return ColorConstants.primaryLight;
    }
  }

  List<Widget> _buildHourColumn(
      BuildContext context, int startRagnge, int endRange) {
    return workHours.getRange(startRagnge, endRange).map((e) {
      return _buildButton(
        item: e,
        context: context,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children:
                  _buildHourColumn(context, 0, (workHours.length / 2).floor()),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              children: _buildHourColumn(
                  context, (workHours.length / 2).floor(), workHours.length),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Container(
              height: 25,
              width: 25,
              color: ColorConstants.greenAvailable,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text('Disponível'),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Container(
              height: 25,
              width: 25,
              color: ColorConstants.blueSelected,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text('Selecionado'),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Container(
              height: 25,
              width: 25,
              color: ColorConstants.primaryLight,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text('Ocupado'),
          ],
        ),
      ],
    );
  }
}
