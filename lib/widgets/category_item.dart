import 'package:flutter/material.dart';
import '../shared/colors.dart';

class CategoryItem extends StatelessWidget {
  final int id;
  final String title;
  final String image;
  final String description;

  const CategoryItem({

    @required this.id,
    @required this.title,
    @required this.image,
    @required this.description,
  });

  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(30),
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("images/$image"),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(.2), BlendMode.darken)),
          ),
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      fontFamily: 'CenturyGhotic',
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
              SizedBox(
                height: 20,
              ),
              Text(description,
                  style: TextStyle(
                      fontFamily: 'CenturyGhotic',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      
    );
  }
}
