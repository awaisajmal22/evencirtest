import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/core/dependency_injecction/services_locator.dart';
import 'package:testtask/core/navigation/pages.dart';
import 'package:testtask/core/navigation/routes.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown, 
  ]);
  await ServicesLocator.instance().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorPalette.primary,
          type: BottomNavigationBarType.fixed,
        ),
        scaffoldBackgroundColor: ColorPalette.primary,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: Routes.navBar,
      onGenerateRoute: Pages.onGenerateRoute,
    );
  }
}
