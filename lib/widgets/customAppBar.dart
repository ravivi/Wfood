import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/CartProvider.dart';
import '../widgets/badge.dart';
import '../shared/colors.dart';

Widget customAppBar(
    BuildContext context, GlobalKey<ScaffoldState> _keyScaffold) {
  return AppBar(
    elevation: 0,
    backgroundColor: Color(0xfff7f7f7),
    leading: Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: RotatedBox(
        quarterTurns: 4,
        child: IconButton(
          icon: Icon(
            Icons.sort,
            color: Colors.black54,
          ),
          onPressed: () {
            _keyScaffold.currentState.openDrawer();
          },
        ),
      ),
    ),
    title: RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'W',
          style: TextStyle(
              fontFamily: 'Pacifico',
              color: CustomColors.orange,
              fontWeight: FontWeight.w700,
              fontSize: 21.0)),
      TextSpan(
          text: '-store ',
          style: TextStyle(
              fontFamily: 'CenturyGhotic',
              letterSpacing: 1.8,
              color: CustomColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0))
    ])),
    centerTitle: true,
    actions: <Widget>[
       Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
        child: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: RotatedBox(
              quarterTurns: 4,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'cartPage');
                },
                icon: Icon(Icons.shopping_cart, color: Colors.black54),
              )),
        ),
      ),
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(38.0),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'searchPage');
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: CustomColors.lightGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 12),
                    Icon(Icons.search),
                    SizedBox(width: 12),
                    Text(
                      'Rechercher...',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          // color: whiteColor,
                          fontSize: 12.8,
                          letterSpacing: 1.5),
                    ),
                  ],
                )),
          ),
        ),
      ),
    ),
  );
}
