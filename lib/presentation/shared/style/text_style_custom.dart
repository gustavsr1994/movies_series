import 'package:flutter/material.dart';

TextStyle textSmallColor({Color color, @required bool boldCondition}) {
  return TextStyle(
    fontWeight: boldCondition == true ? FontWeight.bold : FontWeight.normal,
    color: color,
    fontSize: 12,
  );
}

TextStyle textMediumColor({Color color, @required bool boldCondition}) {
  return TextStyle(
    fontWeight: boldCondition == true ? FontWeight.bold : FontWeight.normal,
    color: color,
    fontSize: 15,
  );
}

TextStyle textLargerColor({Color color, @required bool boldCondition}) {
  return TextStyle(
    fontWeight: boldCondition == true ? FontWeight.bold : FontWeight.normal,
    color: color,
    fontSize: 17,
  );
}
