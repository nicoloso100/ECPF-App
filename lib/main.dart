import 'package:ecpfapp/Constants/colors.dart';
import 'package:ecpfapp/Navigation/home_navigation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NeumorphicTheme.isUsingDark(context)
        ? SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light)
        : SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'ECPF-App',
      themeMode: ThemeMode.dark,
      theme: NeumorphicThemeData(
          textTheme: GoogleFonts.assistantTextTheme(),
          baseColor: AppColors.lightPrimary,
          accentColor: AppColors.lightSecundary,
          shadowLightColor: AppColors.lightShadow,
          defaultTextColor: AppColors.lightText,
          lightSource: LightSource.topLeft),
      darkTheme: NeumorphicThemeData(
          textTheme: GoogleFonts.assistantTextTheme(),
          baseColor: AppColors.darkPrimary,
          accentColor: AppColors.darkSecundary,
          shadowLightColor: AppColors.darkShadow,
          defaultTextColor: AppColors.darkText,
          borderColor: AppColors.darkBorder,
          lightSource: LightSource.topLeft),
      home: const HomeNavigation(),
    );
  }
}
