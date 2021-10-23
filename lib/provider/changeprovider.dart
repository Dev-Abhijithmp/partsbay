import 'package:flutter/cupertino.dart';

class Change extends ChangeNotifier {
  int providerindex = 0;

  void changeindex(int index) {
    providerindex = index;
    notifyListeners();
  }
}
