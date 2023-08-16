import 'package:flutter/material.dart';

class BottomSheetViewModel extends ChangeNotifier {
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void expandSheet() {
    _isExpanded = true;
    notifyListeners();
  }

  void collapseSheet() {
    _isExpanded = false;
    notifyListeners();
  }
}
