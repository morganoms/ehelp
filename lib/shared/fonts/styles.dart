import 'package:ehelp/shared/colors/constants.dart';
import 'package:flutter/material.dart';

class FontStyles {
  FontStyles._();

  static TextStyle? size20Weight700green = const TextStyle(
    fontSize: 20,
    color: ColorConstants.greenAvailable,
    fontWeight: FontWeight.w700,
  );

  static TextStyle? size18Weight400 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static TextStyle? size16Weight700 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static TextStyle? size16Weight400 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle? size14Weight500 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle? size14Weight400 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle? size14Weight500colorPrimary = const TextStyle(
    fontSize: 14,
    color: ColorConstants.primaryColor,
    fontWeight: FontWeight.w500,
  );
}
