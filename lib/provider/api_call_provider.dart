import 'package:flutter/material.dart';
import 'package:provider_counter_app/model/data_model.dart';
import 'package:provider_counter_app/services/network_requister.dart';

class ApiCallProvider with ChangeNotifier {
  bool isLoading = false;

  //------------>search text store searchText<--------------------//

  String searchText = "";

  List<DataModel> _data = [];

  List<DataModel> get data => _data;
  List<DataModel> searchData = [];

  dataGet() async {
    isLoading = true;
    notifyListeners();
    final response = await NetworkRequister().getData();
    //------------>condition check for <--------------------//
    
    if(searchText.isEmpty){
      _data = response;

    }
    else{
      _data=response.where((element) => element.title.toLowerCase().startsWith(searchText)).toList();
    }

    print("isLoading $isLoading");

    isLoading = false;

    notifyListeners();
  }
  //------------> search data and call function data get<--------------------//
  
  search(String username) {
    searchText = username;
    dataGet();
  }

}
