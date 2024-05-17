

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {

  //is loading set
  bool _isLoading=false;
  //get is loading
  bool get isLoading=>_isLoading;
  //set loading
  setLoading(bool status){
    _isLoading=status;
    notifyListeners();
  }


  loginWithApi(userName, password) async {
    try{
      setLoading(true);
      http.Response response = await http.post(
          Uri.parse("https://reqres.in/api/login"),
          body: {"email": userName, "password": password});

      if(response.statusCode==200){
        setLoading(false);
        print("Login Successfull");
      }else{

        setLoading(false);
        print("Login not Successfull");
      }

    }catch(e){
      print(e);
    }

  }
}
