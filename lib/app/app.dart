import 'package:e_commerce/app/injector.dart';
import 'package:e_commerce/module/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:e_commerce/module/features/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce/module/features/auth/presentation/screens/register_screen.dart';
import 'package:e_commerce/module/features/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/module/features/home/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/router/app_routes.dart';

class MyApp extends StatelessWidget {
  ///singleton
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
       initialRoute: Routes.homeRoute,
      // home: const HomeScreen(),
    );
  }
}
