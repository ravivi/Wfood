
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/menuModel.dart';



class MenuProvider with ChangeNotifier  {
  List<Menu> menu = [];

  Future getcategorie() async {
    List<Menu> res = await Menu().loadchargerJson();
    print(res);
    if (res != null) {
      menu = res;
    }
    notifyListeners();
  }
 Menu findById(int id) {
    return menu.firstWhere((prod) => prod.id == id);
  }
}
class ListMenuProvider with ChangeNotifier  {
  List<ListMenu> menu = [];

  Future getcategorie() async {
    List<ListMenu> res = await ListMenu().loadchargerJson();
    print(res);
    if (res != null) {
      menu = res;
    }
    notifyListeners();
  }
 ListMenu findById(int id) {
    return menu.firstWhere((prod) => prod.id == id);
  }
}

    

