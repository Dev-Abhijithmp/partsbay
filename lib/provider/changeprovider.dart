import 'package:flutter/cupertino.dart';

class Change extends ChangeNotifier {
  String notifysize = '';
  double total = 0;
  void changesize(String size) {
    notifysize = size;
    notifyListeners();
  }

  void changetotal(double price, int count) {
    total = total + (price * count);
    notifyListeners();
  }
}
