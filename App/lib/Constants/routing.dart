import 'package:flutter_neumorphic/flutter_neumorphic.dart';

GlobalKey<NavigatorState> homeNavigationKey = GlobalKey<NavigatorState>();

class HomeRoutes {
  static const String home = "/";
  static const String showCalculator = "/showCalculator";
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String logged = "/logged";
}

class LoggedRoutes {
  static const String showRecords = "/showRecords";
  static const String addRecord = "/addRecord";
  static const String recordDetails = "/recordDetails";
}
