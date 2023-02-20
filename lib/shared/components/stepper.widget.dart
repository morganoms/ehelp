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
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalSteps,
        (index) => Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Container(
                  height: MediaQuery.of(context).size.width / 10,
                  width: MediaQuery.of(context).size.width / 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: (index < totalActiveSteps)
                        ? ColorConstants.greenStrong
                        : ColorConstants.primaryLight,
                  ),
                  child: Center(
                    child: Text(
                      (index + 1 == totalActiveSteps)
                          ? '$totalActiveSteps'
                          : '',
                      style: FontStyles.size14Weight700,
                    ),
                  ),
                ),
              ),
              if (index != totalSteps - 1)
                Flexible(
                  child: Container(
                    height: 1,
                    color: ColorConstants.primaryLight,
                  ),
                )
            ],
          ),
        ),
      ).toList(),
    );
  }
}
