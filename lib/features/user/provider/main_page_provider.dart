

import 'package:flutter/cupertino.dart';

class MainPageProvider with ChangeNotifier{
  //Encapsulation
  int _currentPage =0;
  int get currentPage=>_currentPage;

  void setCurrentPage(int index){
    _currentPage= index;
    notifyListeners();

  }

}