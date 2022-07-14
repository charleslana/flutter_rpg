import 'package:flutter/material.dart';
import 'package:flutter_rpg/bindings/language_binding.dart';
import 'package:flutter_rpg/bindings/loading_overlay_binding.dart';
import 'package:flutter_rpg/bindings/login_binding.dart';
import 'package:flutter_rpg/bindings/sliver_app_bar_binding.dart';
import 'package:flutter_rpg/bindings/splashscreen_binding.dart';
import 'package:flutter_rpg/pages/login_page.dart';
import 'package:flutter_rpg/pages/splashscreen_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppRouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashscreen:
        return GetPageRoute(
          page: () => const SplashscreenPage(),
          settings: settings,
          binding: SplashscreenBinding(),
        );
      case AppRoutes.login:
        return GetPageRoute(
          page: () => const LoginPage(),
          settings: settings,
          bindings: [
            LanguageBinding(),
            SliverAppBarBinding(),
            LoginBinding(),
            LoadingOverlayBinding(),
          ],
          transition: Transition.rightToLeft,
        );
      default:
        return GetPageRoute(
          page: () => SafeArea(
            child: Scaffold(
              body: Center(
                child: Text('No path for ${settings.name}'),
              ),
            ),
          ),
        );
    }
  }
}
