import 'package:Wfood/data/MenuModel.dart';
import 'package:Wfood/data/data.dart';

import '../providers/MenuProvider.dart';
import 'package:provider/provider.dart';

import '../shared/colors.dart';
import 'package:flutter/material.dart';

class MenuListDetail extends StatefulWidget {
  @override
  _MenuListDetailState createState() => _MenuListDetailState();
}

class _MenuListDetailState extends State<MenuListDetail> {
  bool _isInit = true;
  bool _isLoaded = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoaded = true;
      });
      Provider.of<ListMenuProvider>(context, listen: false)
          .getcategorie()
          .then((_) {
        setState(() {
          _isLoaded = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var menuList =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    List<Map<String, Object>> list = theJuiceBar["produit"];
    print(list[0]["nom"]);

    return Scaffold(
      body: _isLoaded
          ? Center(
              child: CircularProgressIndicator(),
            )
          : DefaultTabController(
              length: 2,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      elevation: 0,
                      backgroundColor: CustomColors.orange,
                      expandedHeight: 250.0,
                      floating: false,
                      pinned: true,
                      iconTheme: IconThemeData(color: Colors.white),
                      title: Text(
                        menuList["nom"],
                        style: TextStyle(color: Colors.white),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                          background: Image.asset("images/${menuList["image"]}",
                              fit: BoxFit.cover, height: 300)),
                    ),
                  ];
                },
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      categorieFilm(context, theJuiceBar["nom"], list),
                      categorieFilm(context, lesSweetNFast["nom"],
                          lesSweetNFast["produit"]),
                      categorieFilm(
                          context, lesSnacks["nom"], lesSnacks["produit"]),

                      categorieFilm(context, lesBoissonsChaudes["nom"],
                          lesBoissonsChaudes["produit"]),
                      // categorieFilm(context, "Juice Bar", args.produit),
                      // categorieFilm(context, "Juice Bar", args.produit)
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget categorieFilm(BuildContext context, String titre, List list) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                titre,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'allFilm', arguments: list);
                },
                child: Text(
                  "Voir plus",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  // onTap: () {
                  //   Navigator.pushNamed(context, 'detailFilm',
                  //       arguments: list[i]);
                  // },
                  // onLongPress: () {
                  //   Navigator.of(context).push(new PageRouteBuilder(
                  //       opaque: false,
                  //       pageBuilder: (BuildContext context, _, __) {
                  //         return new Material(
                  //             color: Colors.black38,
                  //             child: new Container(
                  //               padding: const EdgeInsets.all(30.0),
                  //               child: new InkWell(
                  //                 child: Hero(
                  //                   tag: list[i].image,
                  //                   child: Column(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.center,
                  //                     children: <Widget>[
                  //                       Container(
                  //                         height: MediaQuery.of(context)
                  //                                 .size
                  //                                 .height /
                  //                             2,
                  //                         width: 300,
                  //                         alignment: Alignment.centerRight,
                  //                         decoration: BoxDecoration(
                  //                             color: Colors.red,
                  //                             image: DecorationImage(
                  //                               image: AssetImage(
                  //                                   "images/${list[i].image}"),
                  //                               fit: BoxFit.fill,
                  //                             )),
                  //                         child: Container(
                  //                           color: Colors.white,
                  //                           child: Column(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.spaceEvenly,
                  //                             children: <Widget>[
                  //                               Card(
                  //                                 child: Container(
                  //                                   alignment: Alignment.center,
                  //                                   height: 50,
                  //                                   width: 50,
                  //                                   child: Column(
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment
                  //                                             .center,
                  //                                     children: <Widget>[
                  //                                       Icon(Icons
                  //                                           .favorite_border),
                  //                                       Text("100"),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                               Card(
                  //                                 child: Container(
                  //                                   alignment: Alignment.center,
                  //                                   height: 50,
                  //                                   width: 50,
                  //                                   color: Colors.white,
                  //                                   child: Column(
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment
                  //                                             .center,
                  //                                     children: <Widget>[
                  //                                       Icon(Icons.message),
                  //                                       Text("100"),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                               Card(
                  //                                 child: Container(
                  //                                   alignment: Alignment.center,
                  //                                   height: 50,
                  //                                   width: 50,
                  //                                   child: Column(
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment
                  //                                             .center,
                  //                                     children: <Widget>[
                  //                                       Icon(Icons.share),
                  //                                       Text("100"),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                               Card(
                  //                                 child: Container(
                  //                                   alignment: Alignment.center,
                  //                                   height: 50,
                  //                                   width: 50,
                  //                                   child: Column(
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment
                  //                                             .center,
                  //                                     children: <Widget>[
                  //                                       Icon(Icons
                  //                                           .file_download),
                  //                                       Text("100"),
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 onTap: () {
                  //                   Navigator.pop(context);
                  //                 },
                  //               ),
                  //             ));
                  //       }));
                  // },

                  child: Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3.4,
                      height: MediaQuery.of(context).size.height / 5.2,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 3.4,
                            height: 80,
                            child: Image.asset(
                              "images/${list[i]["image"]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.4,
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              list[i]["nom"],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.4,
                            padding: EdgeInsets.only(left: 10, top: 5),
                            child: Text(
                              "${list[i]["prix"]} Fcfa",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: CustomColors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
