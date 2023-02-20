import 'package:flutter/material.dart';

import '../colors/constants.dart';
import '../fonts/styles.dart';

class HeaderBlack extends StatelessWidget {
  const HeaderBlack(
      {required this.titleLable, this.child, this.iconBack, Key? key})
      : super(key: key);
  final Widget? iconBack;
  final String titleLable;
  final Widget? child;

  Widget get iconMask => const Icon(
        Icons.arrow_back_rounded,
        color: ColorConstants.blackSoft,
      );

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: ColorConstants.blackSoft,
        width: double.infinity,
        child: SafeArea(
          bottom: false,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            margin: EdgeInsets.only(
              bottom: child != null ? 0 : 24,
            ),
            height: MediaQuery.of(context).size.height / 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: prefer_if_elements_to_conditional_expressions
                iconBack != null ? iconBack! : iconMask,
                Center(
                  child: Text(
                    titleLable,
                    style: FontStyles.size20Weight400white,
                    textAlign: TextAlign.center,
                  ),
                ),
                iconMask
              ],
            ),
          ),
        ),
      ),
      if (child != null) child!,
      Container(
        color: ColorConstants.blackSoft,
        child: Container(
          width: double.infinity,
          height: 48,
          decoration: const BoxDecoration(
            color: ColorConstants.whiteBackground,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
        ),
      ),
    ]);
  }
}
