import '../providers/MenuProvider.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';

import '../shared/colors.dart';

import '../widgets/customAppBar.dart';
import 'package:flutter/material.dart';



class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
   bool _isInit=true;
  bool _isLoaded=false;
  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();
     @override
  void didChangeDependencies() {
    if(_isInit){
      setState(() {
        _isLoaded = true;
      });
      Provider.of<MenuProvider>(context, listen: false).getcategorie().then((_){
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
      final loaded = Provider.of<MenuProvider>(context, listen: false);
      
    return Scaffold(
      key: _keyScaffold,
      appBar: customAppBar(context, _keyScaffold),
      drawer: MainDrawer(),
      body: _isLoaded ? Center(
        child: CircularProgressIndicator(),)
          :ListView.builder(
        itemCount: loaded.menu.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'listMenu',arguments: loaded.menu[i].id);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Card(
                elevation: 4,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/${loaded.menu[i].image}"),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 20,top: 10),
                        child: Text(loaded.menu[i].nom,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: CustomColors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width ,
                        padding: EdgeInsets.only(left: 20,top: 10),

                        child: Text(
                            loaded.menu[i].description,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: CustomColors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
