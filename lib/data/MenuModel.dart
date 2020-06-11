import 'dart:convert';

import 'package:flutter/services.dart';

class Menu {
  int id;
  String nom;
  String image;
  String description;
  List<ListMenu> listMenu;

  Menu({this.id, this.nom, this.image, this.description, this.listMenu});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    image = json['image'];
    description = json['description'];
    if (json['listMenu'] != null) {
      listMenu = new List<ListMenu>();
      json['listMenu'].forEach((v) {
        listMenu.add(new ListMenu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['image'] = this.image;
    data['description'] = this.description;
    if (this.listMenu != null) {
      data['listMenu'] = this.listMenu.map((v) => v.toJson()).toList();
    }
    return data;
  }
    Future<String> chargerJson() async {
    return await rootBundle.loadString("assets/dataList.json");
  }

  Future loadchargerJson() async {
    final charge = await chargerJson();
    Iterable response = json.decode(charge);

    List<Menu> arr =
        response.map((i) => Menu.fromJson(i)).toList();
    return arr;
  }

}

class ListMenu {
  int id;
  String nom;
  String image;
  String description;
  List<MenuComplet> menuComplet;

  ListMenu({this.id, this.nom, this.image, this.description, this.menuComplet});

  ListMenu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    image = json['image'];
    description = json['description'];
    if (json['MenuComplet'] != null) {
      menuComplet = new List<MenuComplet>();
      json['MenuComplet'].forEach((v) {
        menuComplet.add(new MenuComplet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['image'] = this.image;
    data['description'] = this.description;
    if (this.menuComplet != null) {
      data['MenuComplet'] = this.menuComplet.map((v) => v.toJson()).toList();
    }
    return data;
  }
  Future<String> chargerJson() async {
    return await rootBundle.loadString("assets/dataList.json");
  }

  Future loadchargerJson() async {
    final charge = await chargerJson();
    Iterable response = json.decode(charge);

    List<ListMenu> arr =
        response.map((i) => ListMenu.fromJson(i)).toList();
    return arr;
  }
}

class MenuComplet {
  int id;
  String nom;
  String image;
  String description;
  List<Produit> produit;

  MenuComplet({this.id, this.nom, this.image, this.description, this.produit});

  MenuComplet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    image = json['image'];
    description = json['description'];
    if (json['produit'] != null) {
      produit = new List<Produit>();
      json['produit'].forEach((v) {
        produit.add(new Produit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['image'] = this.image;
    data['description'] = this.description;
    if (this.produit != null) {
      data['produit'] = this.produit.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Produit {
  int id;
  String nom;
  String image;
  String description;
  int prix;

  Produit({this.id, this.nom, this.image, this.description, this.prix});

  Produit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    image = json['image'];
    description = json['description'];
    prix = json['prix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['image'] = this.image;
    data['description'] = this.description;
    data['prix'] = this.prix;
    return data;
  }
}