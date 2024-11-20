import 'package:flutter/material.dart';

Widget customButton(
    {required String btnName,
      required Color borderColor,
      Color? textColor,
      Color? color,
      required BuildContext context,
      BoxBorder? border,
      void Function()? onTap}) {
  final size = MediaQuery.sizeOf(context);
  return InkWell(
    onTap: onTap,
    child: Container(
      height: size.height * .060,
      width: size.width * .9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        textAlign: TextAlign.center,
        btnName,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'TiroBangla-Italic',
          fontSize: 16,
        ),
      ),
    ),
  );
}
