import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:veflat/configuration.dart' as config;
import 'package:veflat/general/general_models/results_model.dart';

class HomeController extends ChangeNotifier {
  Size size = const Size(0,0);
  List<ResultsModel> charactersImage = [];
  bool _isLoading = false;


  bool get isLoadingGet {
    return _isLoading;
  }

  set isLoadingSet(bool x) {
    _isLoading = x;
    notifyListeners();
  }


  void addCardCharacters (int index){
    config.cardCharacters.add(charactersImage[index]);
    notifyListeners();
  }

  Future<void> getImage () async {
    isLoadingSet =true;
    final url = Uri.parse('https://rickandmortyapi.com/api/character');
    try{
      https.Response response = await https.get(url);
      if(response.statusCode!=200){
        return;
      }
      Map<String, dynamic> body = jsonDecode(response.body);
      for(var element in body['results']){
        ResultsModel tempResult = ResultsModel.fromMap(element);
        charactersImage.add(tempResult);
      }
      isLoadingSet = false;
      notifyListeners();

    } catch (e){
      isLoadingSet = false;
      notifyListeners();
    }
  }

}