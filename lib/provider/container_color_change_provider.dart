import 'package:flutter/cupertino.dart';

class ContainerColorChangeProvider with ChangeNotifier{
  double _ContainerOpacity=.5;
  double get ContainerOpacity=>_ContainerOpacity;

  opacityChange(double value){
    _ContainerOpacity=value;
    notifyListeners();
  }

}