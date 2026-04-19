import 'package:flutter/material.dart';
import 'package:testtask/core/navigation/routes.dart';
import 'package:testtask/features/presentation/views/navbar/navbar_view.dart';

class Pages{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.navBar:
        return MaterialPageRoute(builder: (_)=>  NavBarView());
      default:
        return MaterialPageRoute(builder: (_)=>  NavBarView());
    }
  }
}