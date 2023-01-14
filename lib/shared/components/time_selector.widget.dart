import 'package:ehelp/shared/Colors/constants.dart';
import 'package:flutter/material.dart';

class TimeSelector extends StatelessWidget {
  const TimeSelector({Key? key}) : super(key: key);

  Widget _buildButton(
      {required final String label,
      required Color color,
      required final BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: color,
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
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                _buildButton(
                  label: '8:00',
                  color: ColorConstants.greenAvailable,
                  context: context,
                ),
                _buildButton(
                  label: '9:00',
                  color: ColorConstants.greenAvailable,
                  context: context,
                ),
                _buildButton(
                  label: '10:00',
                  color: ColorConstants.greenAvailable,
                  context: context,
                ),
                _buildButton(
                  label: '11:00',
                  color: ColorConstants.greenAvailable,
                  context: context,
                ),
                _buildButton(
                  label: '12:00',
                  color: ColorConstants.greenAvailable,
                  context: context,
                ),
                _buildButton(
                  label: '13:00',
                  color: ColorConstants.greenAvailable,
                  context: context,
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              children: [
                _buildButton(
                  label: '14:00',
                  color: ColorConstants.greenAvailable,
                  context: context,
                ),
                _buildButton(
                  label: '15:00',
                  color: ColorConstants.greenAvailable,
                  context: context,
                ),
                _buildButton(
                  label: '16:00',
                  color: ColorConstants.greenAvailable,
                  context: context,
                ),
                _buildButton(
                  label: '17:00',
                  color: ColorConstants.greenAvailable,
                  context: context,
                ),
                _buildButton(
                  label: '18:00',
                  color: ColorConstants.greenAvailable,
                  context: context,
                ),
                _buildButton(
                  label: '19:00',
                  color: ColorConstants.greenAvailable,
                  context: context,
                ),
              ],
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
            const Text('Ocupado'),
          ],
        ),
      ],
    );
  }
}
