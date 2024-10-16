import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider_test/api_model.dart';
import 'package:provider_test/api_services.dart';

class DataProvider extends ChangeNotifier{

  ApiService _apiServices = ApiService();

  //Api Model extend..............
  List<DataModel> data = [];
  //Boolean Value
  bool isloading = false;

  // List<DataModel> get datas => data;
  // bool get loading => isloading;

//Provider Main Working Function........
  Future<void> getData()async{
    isloading = true;
    notifyListeners();
    try{
      data = (await _apiServices.getDataApi())!;
    } catch (e){
      log(e.toString());
    }

    isloading = false;
    notifyListeners();
  }
}