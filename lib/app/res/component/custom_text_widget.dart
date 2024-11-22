
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget displayNormal(
    {required String data,
    required EdgeInsetsGeometry padding,
    required TextAlign? textAlign,
      TextDecoration? decoration,
      Color? color,
      double? fontSize}) {
  return Padding(
    padding: padding,
    child: Text(
      data,
      textAlign: textAlign,
      style:  TextStyle(
        color: color,
        fontFamily: 'TiroBangla-Italic',
        fontSize: fontSize,
        decoration: decoration,
        decorationColor: Colors.black.withOpacity(0.5),
      ),
    ),
  );
}

Widget displayMedium(
    {required String data,
    required Color? color,
    required double? fontSize,
    required TextAlign? textAlign,
      FontWeight? fontWeight,
      TextDecoration? decoration}) {
  return AutoSizeText(
    data,
    textAlign: textAlign,
    style: TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
      fontFamily: 'TiroBangla-Italic',
      decoration: decoration,
      decorationColor: Colors.black.withOpacity(0.5),
    ),
  );
}
