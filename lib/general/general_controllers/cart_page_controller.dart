import 'package:flutter/material.dart';
import 'package:veflat/configuration.dart' as config;

class CartController extends ChangeNotifier {
  Size size = const Size(0,0);
  List charactersImage = [];
  int counter = 1;


  void deleteCardCharacter (index){
    config.cardCharacters.removeAt(index);
    notifyListeners();
  }



}