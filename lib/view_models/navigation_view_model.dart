import 'package:flutter/material.dart';
import 'package:stc_flutter_task/views/home/cart_screen.dart';
import 'package:stc_flutter_task/views/home/favorite_screen.dart';
import 'package:stc_flutter_task/views/home/profile_screen.dart';

import '../views/home/home_screen.dart';

class NavigationBarViewModel with ChangeNotifier {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  int get currentIndex => _currentIndex;

  Widget getCurrentPage() {
    return _pages[_currentIndex];
  }

  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
