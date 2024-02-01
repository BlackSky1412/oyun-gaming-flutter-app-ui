import 'package:flutter/material.dart';

class GamingModel {
  String? gameImage;
  bool? selectGame;
  String? drawerItemName;
  Widget? drawerWidget;
  String? title;
  String? time;
  String? day;
  String? rank;
  String? earned;
  double? rating;
  List<String>? productImage;
  String? mainPrice;
  int? ratingProgress;
  String? email;

  GamingModel({this.gameImage, this.ratingProgress, this.selectGame, this.drawerItemName, this.drawerWidget, this.title, this.rating, this.time, this.day, this.earned, this.rank, this.productImage, this.mainPrice, this.email});
}
