import 'package:flutter/material.dart';

double baseHeigth = 640.0;

double screenAware(double size, BuildContext context){
  return size* MediaQuery.of(context).size.height/baseHeigth;
}


Widget colorItem(
    Color color, bool isSelected, BuildContext context, VoidCallback _ontab) {
  return GestureDetector(
    onTap: _ontab,
    child: Padding(
      padding: EdgeInsets.only(left: screenAware(10, context)),
      child: Container(
        height: screenAware(30, context),
        width: screenAware(30, context),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.8),
                    offset: Offset(0.0, 10),
                  )
                ]
              : [],
        ),
        child: ClipPath(
          clipper: Hklimer(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: color,
          ),
        ),
      ),
    ),
  );
}

class Hklimer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);
    path.close();
    // TODO: implement getClip
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
