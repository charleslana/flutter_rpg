import 'package:flutter/material.dart';
import 'package:flutter_rpg/bindings/character_binding.dart';
import 'package:flutter_rpg/bindings/landing_binding.dart';
import 'package:flutter_rpg/bindings/language_binding.dart';
import 'package:flutter_rpg/bindings/loading_overlay_binding.dart';
import 'package:flutter_rpg/bindings/login_binding.dart';
import 'package:flutter_rpg/bindings/register_binding.dart';
import 'package:flutter_rpg/bindings/splashscreen_binding.dart';
import 'package:flutter_rpg/pages/character_page.dart';
import 'package:flutter_rpg/pages/landing_page.dart';
import 'package:flutter_rpg/pages/login_page.dart';
import 'package:flutter_rpg/pages/register_page.dart';
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
      case AppRoutes.landing:
        return GetPageRoute(
          page: () => const LandingPage(),
          settings: settings,
          bindings: [
            LanguageBinding(),
            LandingBinding(),
          ],
          transition: Transition.rightToLeft,
        );
      case AppRoutes.login:
        return GetPageRoute(
          page: () => const LoginPage(),
          settings: settings,
          bindings: [
            LanguageBinding(),
            LoadingOverlayBinding(),
            LoginBinding(),
          ],
          transition: Transition.rightToLeft,
        );
      case AppRoutes.register:
        return GetPageRoute(
          page: () => const RegisterPage(),
          settings: settings,
          bindings: [
            LanguageBinding(),
            LoadingOverlayBinding(),
            RegisterBinding(),
          ],
          transition: Transition.rightToLeft,
        );
      case AppRoutes.characters:
        return GetPageRoute(
          page: () => const CharacterPage(),
          settings: settings,
          bindings: [
            LanguageBinding(),
            LoadingOverlayBinding(),
            CharacterBinding(),
          ],
          transition: Transition.leftToRight,
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
