import 'package:e_commerce/app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings.dart';
import '../../module/features/auth/presentation/bloc/auth_bloc.dart';
import '../../module/features/auth/presentation/screens/login_screen.dart';
import '../../module/features/auth/presentation/screens/register_screen.dart';
import '../../module/features/home/presentation/bloc/home_bloc.dart';
import '../../module/features/home/presentation/screens/home_screen/home_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registersRoute = '/registers';
  static const String layoutRoute = '/layout';
  static const String homeRoute = '/home';
  // static const String cartRoute = '/cart';
  // static const String profileRoute = '/profile';
  // static const String forgetPasswordRoute = '/forgetPassword';
  // static const String storeDetailsRoute = '/storeDetails';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case Routes.splashRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const SplashScreen(),
      //   );
      // case Routes.onboardingRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnBoardingScreen(),
      //   );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.registersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<AuthBloc>(),
            child: const RegisterScreen(),
          ),
        );
      // case Routes.layoutRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const LayoutScreen(),
      //   );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<HomeBloc>()..add(GetHomeDateEvent()),
            child: const HomeScreen(),
          ),
        );
      // case Routes.forgetPasswordRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgetPasswordScreen(),
      //   );
      // case Routes.storeDetailsRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const StoreDetailsScreen(),
      //   );
      //! Default
      default:
        return _unDefinedRoute();
    }
  }

  static MaterialPageRoute<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title:  const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}