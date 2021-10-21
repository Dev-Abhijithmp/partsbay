import 'package:flutter/cupertino.dart';

class Change extends ChangeNotifier {
  String notifysize = '';
  void changesize(String size) {
    notifysize = size;
    notifyListeners();
  }
}
