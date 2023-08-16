import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stc_flutter_task/view_models/auth_view_model.dart';
import 'package:stc_flutter_task/view_models/bottom_sheet_view_model.dart';
import 'package:stc_flutter_task/view_models/navigation_view_model.dart';
import 'package:stc_flutter_task/view_models/products_view_model.dart';
import 'package:stc_flutter_task/views/home/bottom_navigation_bar.dart';
import 'package:stc_flutter_task/views/login/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavigationBarViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomSheetViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductViewModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'STC',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
        routes: {
          MyBottomNavigationBar.routeName: (context) =>
              const MyBottomNavigationBar(),
        },
      ),
    );
  }
}
