import 'package:flutter/material.dart';
import 'package:provider_counter_app/model/data_model.dart';
import 'package:provider_counter_app/services/network_requister.dart';

class ApiCallProvider with ChangeNotifier {
  bool isLoading=false;
     List<DataModel> _data=[];
     List<DataModel>get data=>_data;



  dataGet() async {
    isLoading=true;
    final response = await NetworkRequister()
        .getData("https://jsonplaceholder.typicode.com/comments/1");
    _data=response;

    print("nnnnnnnnnnnnnnnnnnnn$data");
    isLoading=false;
    notifyListeners();
  }

}
