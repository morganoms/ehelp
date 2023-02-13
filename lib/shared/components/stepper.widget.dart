import 'package:ehelp/shared/Colors/constants.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget(
      {final Key? key,
      required this.totalSteps,
      required this.totalActiveSteps})
      : super(key: key);

  final int totalSteps;
  final int totalActiveSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        totalSteps,
        (index) => Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                Container(
                  height: 5,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(18),
                    color: (index < totalActiveSteps)
                        ? ColorConstants.primaryColor
                        : ColorConstants.primaryLight,
                  ),
                  width: MediaQuery.of(context).size.width / totalSteps,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    (index + 1 == totalActiveSteps) ? '$totalActiveSteps' : '',
                    style: FontStyles.size14Weight400,
                  ),
                )
              ],
            ),
          ),
        ),
      ).toList(),
    );
  }
}
