import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stc_flutter_task/view_models/navigation_view_model.dart';

class MyBottomNavigationBar extends StatelessWidget {
  static const routeName = '/nav_screen';

  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigationBarViewModel>(
        builder: (context, navigationViewModel, _) {
          return navigationViewModel.getCurrentPage();
        },
      ),
      bottomNavigationBar: Consumer<NavigationBarViewModel>(
        builder: (context, navigationViewModel, _) => BottomNavigationBar(
          currentIndex: navigationViewModel.currentIndex,
          onTap: (index) {
            navigationViewModel.changePage(index);
          },
          elevation: 20,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: const Color.fromRGBO(42, 179, 198, 1),
          unselectedItemColor: const Color.fromRGBO(191, 194, 200, 1),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
