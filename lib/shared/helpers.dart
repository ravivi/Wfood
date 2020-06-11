import 'package:flutter/material.dart';
import '../shared/colors.dart';


Widget iconStyle(IconData icon, {Color color = CustomColors.iconColor, double size = 20, double padding = 10,}) {
  return Container(
    height: 40,
    width: 40,
    padding: EdgeInsets.all(padding),
    // margin: EdgeInsets.all(padding),
    decoration: BoxDecoration(
      border: Border.all(
        color: CustomColors.iconColor,
        style: BorderStyle.solid
      ),
      borderRadius: BorderRadius.all(Radius.circular(13)),
      color: CustomColors.background,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Color(0xfff8f8f8),
          blurRadius: 5,
          spreadRadius: 10,
          offset: Offset(5, 5)
        ),
      ],
    ),
    child: Icon(icon, color: color, size: size),
  );
}

Widget colorWidget(Color color, {bool isSelected = false}) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: color.withAlpha(150),
      child: isSelected
          ? Icon(
              Icons.check_circle,
              color: color,
              size: 18,
            )
          : CircleAvatar(radius: 7, backgroundColor: color),
    );
  }