import 'package:Wfood/providers/MenuProvider.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/customAppBar.dart';
import '../shared/colors.dart';
import '../widgets/category_item.dart';
import '../widgets/main_drawer.dart';

class ListMenuScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //final cat = Provider.of<CategoryData>(context, listen: false);

    final menuId = ModalRoute.of(context).settings.arguments as int;
    final loadedListMenu =
        Provider.of<MenuProvider>(context, listen: false).findById(menuId);
    parti(int id) {
      Navigator.pushNamed(context, 'listMenuDetail',
          arguments: loadedListMenu.listMenu.firstWhere((i) => i.id == id));
    }

    return Scaffold(
      key: _keyScaffold,
      appBar: customAppBar(context, _keyScaffold),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
          child: new Column(
        children: <Widget>[
          //SizedBox(height: 50,),
          new Container(
            //Caroussel
            height: 200,

            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
            alignment: Alignment.center,

            child: new ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: Carousel(
                images: [
                  AssetImage('images/piza.jpg'),
                  AssetImage('images/piz.jpg'),
                  AssetImage('images/poul5.jpg'),
                  AssetImage('images/poul4.jpg'),
                  AssetImage('images/poul3.jpg'),
                ],
                animationCurve: Curves.linearToEaseOut,
                autoplayDuration: const Duration(seconds: 4),
                animationDuration: const Duration(milliseconds: 3),
                dotPosition: DotPosition.bottomCenter,
                dotIncreasedColor: CustomColors.orange,
                dotColor: Colors.grey,
                dotVerticalPadding: 25.0,
                dotSize: 4.0,
                dotSpacing: 15.0,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.transparent,
                borderRadius: false,
              ),
            ),
          ),
          new Container(
            height: 35,
            margin: EdgeInsets.symmetric(horizontal: 7.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(247, 246, 247, 1),
                borderRadius: BorderRadius.circular(7.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Menu grand Public',
                      style: TextStyle(
                          fontFamily: 'CenturyGhotic',
                          color: CustomColors.lightblack,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: CustomColors.lightblack,
                  ),
                ],
              ),
            ),
          ),
          for (var item in loadedListMenu.listMenu)
            InkWell(
              onTap: () {
                //print(item.runtimeType);
                Navigator.pushNamed(context, 'listMenuDetail',
                    arguments: {
                      "nom":item.nom,
                      "image":item.image,
                      "list":item.menuComplet
                    });
              },
              child: CategoryItem(
                  id: item.id,
                  title: item.nom,
                  image: item.image,
                  description: item.description),
            ),
          //  Container(
          //   height: 35,
          //   margin: EdgeInsets.symmetric(horizontal: 7.0),
          //   decoration: BoxDecoration(
          //       color: Color.fromRGBO(247, 246, 247, 1),
          //       borderRadius: BorderRadius.circular(7.0)),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: <Widget>[
          //         new Text('Hot Product',
          //             style: TextStyle(
          //                 fontFamily: 'CenturyGhotic',
          //                 color: CustomColors.lightblack,
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.w700)),
          //         Icon(
          //           Icons.arrow_forward_ios,
          //           size: 16,
          //           color: CustomColors.lightblack,
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      )),
    );
  }
}
